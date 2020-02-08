module Tracking
  module Infrastructure
    module Repositories
      class TrackingRepository < ActiveRepository::BaseRepository
        include Tracking::Container::Inject[tracking_oersistence: "tracking.tracking_persistence"]

        def assign_tracking_number_to_cargo(assign_tracking_number_command)
        end

        def add_tracking_event(add_tracking_event_command)
          
        end
      end
    end
  end
end
