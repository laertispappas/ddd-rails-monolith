module Tracking
  module Domain
    module Aggregates
      class TrackingActivity < Entity
        attribute :tracking_number, Types.Instance(Aggregates::TrackingNumber)
        attribute :tracking_booking_id, Types.Instance(Entities::TrackingBookingId)
        attribute :tracking_activity_event, Types.Instance(Entities::TrackingActivityEvent)
      end
    end
  end
end
