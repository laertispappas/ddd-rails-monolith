module Booking
  module Domain
    module ValueObjects
      class Delivery < ValueObject
        attribute :routing_status, ValueObjects::RoutingStatus
        attribute :transport_status, ValueObjects::TransportStatus
        attribute :last_known_location, Types.Instance(Entities::Location).optional
        attribute :current_voyage, Types.Instance(ValueObjects::Voyage).optional
        attribute :last_event, Types.Instance(ValueObjects::LastCargoHandledEvent)



        # attribute :nextExpectedActivity, Types.Instance(ValueObjects::CargoHandlingActivity)

        # Predictions for the Cargo activity. Helps the operator in determining if
        # anything needs to be changed for the future
        # NO_ACTIVITY = CargoHandlingActivity.new

        def self.derived_from(itinerary, last_cargo_handled_event)
          last_known_location = calculate_transport_status(last_cargo_handled_event)

          new(lastEvent: last_cargo_handled_event,
              routing_status: calculate_routing_status(itinerary),
              transport_status: calculate_transport_status(last_cargo_handled_event),
              last_known_location: calculate_last_known_location(last_cargo_handled_event),
              current_voyage: calculate_current_voyage(last_known_location, last_cargo_handled_event),
              last_event: last_cargo_handled_event
          )
        end

        def self.calculate_routing_status(itinerary)
          if itinerary.nil? || itinerary == ValueObjects::CargoItinerary::EMPTY
            ValueObjects::RoutingStatus["NOT_ROUTED"]
          else
            ValueObjects::RoutingStatus["ROUTED"]
          end
        end

        def self.calculate_transport_status(last_event)
          case last_event.handling_event_type
          when nil
            ValueObjects::TransportStatus["NOT_RECEIVED"]
          when "LOAD"
            ValueObjects::TransportStatus["ONBOARD_CARRIER"]
          when "UNLOAD", "RECEIVE", "CUSTOMS"
            ValueObjects::TransportStatus["IN_PORT"]
          when "CLAIM"
            ValueObjects::TransportStatus["CLAIMED"]
          else
            ValueObjects::TransportStatus["UNKNOWN"]
          end
        end

        def self.calculate_last_known_location(last_event)
          return nil unless last_event.handling_event_location

          Entities::Location.new(un_loc_code: last_event.handling_event_location)
        end

        def self.calculate_current_voyage(transport_status, last_event)
          if transport_status == ValueObjects::TransportStatus["ONBOARD_CARRIER"] && last_event.present?
            ValueObjects::Voyage.new(number: last_event.handling_event_voyage)
          end
        end
      end
    end
  end
end
