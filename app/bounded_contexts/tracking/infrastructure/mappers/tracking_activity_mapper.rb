module Tracking
  module Infrastructure
    module Mappers
      module TrackingActivityMapper
        module_function

        def to_entity(dao)
          Domain::Aggregates::TrackingActivity.new(
            tracking_number: Domain::Aggregates::TrackingNumber.new(value: dao.tracking_number),
            booking_id: Domain::Entities::TrackingBookingId.new(value: dao.booking_id),
            tracking_activity_event: Domain::Entities::TrackingActivityEvent::EMPTY_ACTIVITY # TODO
          )
        end

        def to_dao(tracking_activity_entity)
          {
            tracking_number: tracking_activity_entity.tracking_number.value,
            booking_id: tracking_activity_entity.booking_id.value
          }
        end
      end
    end
  end
end
