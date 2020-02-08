module Tracking
  module Infrastructure
    module Persistence
      class TrackingPersistence < SharedDomain::Infrastructure::Persistence
        self.table_name = "tracking_activities"
      end
    end
  end
end
