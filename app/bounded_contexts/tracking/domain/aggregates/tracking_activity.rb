module Tracking
  module Domain
    module Aggregates
      class TrackingActivity < Entity
        DEFAULT_COLLECTION = [].freeze

        attribute :tracking_number, Types.Instance(Aggregates::TrackingNumber)
        attribute :booking_id, Types.Instance(Entities::TrackingBookingId)
        attribute :tracking_activity_events, Types::Array.of(ValueObjects::TrackingEvent)

        def self.from_command(assign_tracking_number_command)
          new(
            tracking_number: TrackingNumber.new(value: assign_tracking_number_command.tracking_number),
            booking_id: Entities::TrackingBookingId.new(value: assign_tracking_number_command.booking_id),
            tracking_activity_events: []
          )
        end

        def add_tracking_event(add_tracking_event_command)
          event = ValueObjects::TrackingEvent.new(
            tracking_voyage_number: ValueObjects::TrackingVoyageNumber.new(
              value: add_tracking_event_command.voyage_number
            ),
            tracking_location: ValueObjects::TrackingLocation.new(
              un_loc_code: add_tracking_event_command.location
            ),
            event_type: add_tracking_event_command.event_type,
            event_time: add_tracking_event_command.event_time.to_datetime,
          )
          self.attributes[:tracking_activity_events] = self.tracking_activity_events + [event]
        end
      end
    end
  end
end
