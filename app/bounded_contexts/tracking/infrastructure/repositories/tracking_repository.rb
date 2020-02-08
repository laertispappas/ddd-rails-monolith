module Tracking
  module Infrastructure
    module Repositories
      class TrackingRepository < ActiveRepository::BaseRepository
        include Tracking::Container::Inject[tracking_oersistence: "tracking.tracking_persistence"]

        def next_tracking_number
          SecureRandom.uuid.upcase
        end

        # Unit of work callbacks

        def persist_new(entity)
          
        end
      end
    end
  end
end
