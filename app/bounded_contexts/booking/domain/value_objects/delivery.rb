module Booking
  module Domain
    module ValueObjects
      class Delivery < ValueObject
        attribute :routing_status, RoutingStatus
        attribute :routing_status, TransportStatus
        attribute :last_known_location, Types.Instance(Entities::Location)
        attribute :current_voyage, Types.Instance(ValueObjects::Voyage)
        attribute :last_event, Types.Instance(ValueObjects::LastCargoHandledEvent)
        attribute :transport_status, Types.Instance(ValueObjects::TransportStatus)


        # attribute :nextExpectedActivity, Types.Instance(ValueObjects::CargoHandlingActivity)

        # Predictions for the Cargo activity. Helps the operator in determining if
        # anything needs to be changed for the future
        # NO_ACTIVITY = CargoHandlingActivity.new

        def self.derived_from(route_specification, itinerary, last_cargo_handled_event)
          new(lastEvent: last_cargo_handled_event,
              routingStatus: calculate_routing_status(itinerary, route_specification),
              transport_status: calculate_transport_status,
              last_known_location: calculate_last_known_location,
              current_voyage: calculate_current_voyage
          )

          this.
          this.lastKnownLocation = calculateLastKnownLocation();
          this.currentVoyage = calculateCurrentVoyage();
          Delivery(lastCargoHandledEvent, itinerary, routeSpecification)
        end
      end
    end
  end
end
