module Tracking
  module Infrastructure
    module Persistence
      class HandlingEventPersistence < SharedDomain::Infrastructure::Persistence
        self.table_name = "tracking_handling_events"

        belongs_to :tracking_activity,
                   class_name: "Tracking::Infrastructure::Persistence::TrackingPersistence"
      end
    end
  end
end

