module Tracking
  module Infrastructure
    module Mappers
      module TrackingActivityMapper
        module_function

        def to_entity(dao)
          Domain::Aggregates::TrackingActivity.new(
            id: dao.id,
            tracking_number: Domain::Aggregates::TrackingNumber.new(value: dao.tracking_number),
            booking_id: Domain::Entities::TrackingBookingId.new(value: dao.booking_id),
            tracking_activity_events: to_events_entity(dao)
          )
        end

        def to_dao(tracking_activity_entity)
          {
            tracking_number: tracking_activity_entity.tracking_number.value,
            booking_id: tracking_activity_entity.booking_id.value
          }
        end

        private def to_events_entity(dao)
          dao.tracking_events.map { |evt_dao| TrackingEventMapper.to_entity(evt_dao) }
        end
      end
    end
  end
end
