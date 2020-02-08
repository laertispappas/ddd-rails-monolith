module Booking
  module Infrastructure
    module Mappers
      module LegMapper
        module_function

        def to_entity(leg_dao)
          Domain::ValueObjects::Leg.new(
            voyage: Domain::ValueObjects::Voyage.new(number: leg_dao.voyage_number),
            load_location: Domain::Entities::Location.new(un_loc_code: leg_dao.load_location_id),
            unload_location: Domain::Entities::Location.new(un_loc_code: leg_dao.unload_location_id),
            load_time: leg_dao.load_time.to_datetime,
            unload_time: leg_dao.unload_time.to_datetime
          )
        end

        def to_dao(leg)
          {
            load_time: leg.load_time, unload_time: leg.unload_time,
            load_location_id: leg.load_location.un_loc_code,
            unload_location_id: leg.unload_location.un_loc_code,
            voyage_number: leg.voyage.number,
          }
        end
      end
    end
  end
end
