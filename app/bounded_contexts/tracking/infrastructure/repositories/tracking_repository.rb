module Tracking
  module Infrastructure
    module Repositories
      class TrackingRepository < ActiveRepository::BaseRepository
        include Tracking::Container::Inject[tracking_persistence: "tracking.tracking_persistence"]

        delegate :to_dao, to: Mappers::TrackingActivityMapper
        delegate :to_entity, to: Mappers::TrackingActivityMapper

        def next_tracking_number
          SecureRandom.uuid.upcase
        end

        def find_by_tracking_number(number)
          to_entity(tracking_persistence.find_by(tracking_number: number))
        end

        private

        # Unit of work callbacks

        def persist_new(entity)
          tracking_persistence.create!(to_dao(entity))
        end
      end
    end
  end
end
