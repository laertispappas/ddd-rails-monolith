module Routing
  module Infrastructure
    module Mappers
      module VoyageMapper
        module_function

        def to_entity(dao)
          Domain::Aggregates::Voyage.new(
            id: dao.id,
            schedule: Domain::ValueObjects::Schedule.new(
              carrier_movements: dao.carrier_movements.map(&method(:carrier_movement_entity))
            ),
            voyage_number: Domain::ValueObjects::VoyageNumber.new(value: dao.voyage_number)
          )
        end

        def to_dao(voyage)
          { voyage_number: voyage.voyage_number.value }
        end

        def carrier_movement_dao(carrier_movement)
          {
            arrival_date: carrier_movement.arrival_date,
            departure_date: carrier_movement.departure_date,
            arrival_location_id: carrier_movement.arrival_location.un_loc_code,
            departure_location_id: carrier_movement.departure_location.un_loc_code
          }
        end

        def carrier_movement_entity(dao)
          Domain::Entities::CarrierMovement.new(
            id: dao.id,
            arrival_date: dao.arrival_date.to_datetime,
            departure_date: dao.departure_date.to_datetime,
            arrival_location: Domain::ValueObjects::Location.new(un_loc_code: dao.arrival_location_id),
            departure_location: Domain::ValueObjects::Location.new(un_loc_code: dao.departure_location_id),
          )
        end
      end
    end
  end
end
