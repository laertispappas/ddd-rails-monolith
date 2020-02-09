module Routing
  module Infrastructure
    module Mappers
      module VoyageMapper
        module_function

        def to_entity(dao)
        end

        def to_dao(voyage)
          { voyage_number: voyage.voyage_number.value }
        end
      end
    end
  end
end
