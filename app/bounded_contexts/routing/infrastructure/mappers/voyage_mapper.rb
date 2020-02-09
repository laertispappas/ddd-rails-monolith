module Routing
  module Infrastructure
    module Mappers
      module VoyageMapper
        module_function

        def to_entity(dao)
          Domain::Aggregates::Voyage.new(
            id: dao.id
          )
        end

        def to_dao(voyage)
          { voyage_number: voyage.voyage_number.value }
        end

        def carrier_movement_dao(carrier_movement)
          {  }
        end

        def carrier_movement_entity(dao)
          Domain::Entities::CarrierMovement.new(
            id: dao.id
          )
        end
      end
    end
  end
end
