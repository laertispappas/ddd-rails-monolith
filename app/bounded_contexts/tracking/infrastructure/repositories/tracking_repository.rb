module Tracking
  module Infrastructure
    module Repositories
      class TrackingRepository < ActiveRepository::BaseRepository
        include Tracking::Container::Inject[tracking_oersistence: "tracking.tracking_persistence"]
      end
    end
  end
end
