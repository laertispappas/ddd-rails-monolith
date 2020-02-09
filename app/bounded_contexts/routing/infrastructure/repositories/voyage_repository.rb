module Routing
  module Infrastructure
    module Repositories
      class VoyageRepository < ActiveRepository::BaseRepository
        include Routing::Container::Inject[
                  voyage_persistence: "routing.voyage_persistence",
                  carrier_movement_persistence: "routing.carrier_movement_persistence"
                ]

        delegate :to_entity, to: Mappers::VoyageMapper
        delegate :to_dao, to: Mappers::VoyageMapper
        delegate :carrier_movement_dao, to: Mappers::VoyageMapper

        def find_all
          voyage_persistence.
            includes(:carrier_movements).
            all.map(&method(:to_entity))
        end

        private

        def persist_new(voyage)
          voyage_dao = voyage_persistence.create!(to_dao(voyage))
          voyage.schedule.carrier_movements.each do |movement|
            carrier_movement_persistence.create!(
              carrier_movement_dao(movement).
              merge(voyage_id: voyage_dao.id)
            )
          end
        end
      end
    end
  end
end
