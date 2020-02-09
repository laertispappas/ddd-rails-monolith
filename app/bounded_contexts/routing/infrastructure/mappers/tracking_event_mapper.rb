module Tracking
  module Infrastructure
    module Mappers
      module TrackingEventMapper
        module_function

        def to_entity(tracking_event_dao)
          Domain::ValueObjects::TrackingEvent.new(
            tracking_voyage_number: Domain::ValueObjects::TrackingVoyageNumber.new(
              value: tracking_event_dao.voyage_number
            ),
            tracking_location: Domain::ValueObjects::TrackingLocation.new(
              un_loc_code: tracking_event_dao.location_id
            ),
            event_type: tracking_event_dao.event_type,
            event_time: tracking_event_dao.event_time.to_datetime,
          )
        end

        def to_dao(tracking_event)
          {
            event_type: tracking_event.event_type,
            event_time: tracking_event.event_time,
            location_id: tracking_event.tracking_location.un_loc_code,
            voyage_number: tracking_event.tracking_voyage_number.value
          }
        end
      end
    end
  end
end
