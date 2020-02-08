module Tracking
  module Domain
    module Aggregates
      class TrackingActivity < Entity
        attribute :tracking_number, Types.Instance(Aggregates::TrackingNumber)
        attribute :booking_id, Types.Instance(Entities::TrackingBookingId)
        attribute :tracking_activity_event, Types.Instance(Entities::TrackingActivityEvent)

        def self.from_command(assign_tracking_number_command)
          new(
            tracking_number: TrackingNumber.new(value: assign_tracking_number_command.tracking_number),
            booking_id: Entities::TrackingBookingId.new(value: assign_tracking_number_command.booking_id),
            tracking_activity_event: Entities::TrackingActivityEvent::EMPTY_ACTIVITY
          )
        end
      end
    end
  end
end
