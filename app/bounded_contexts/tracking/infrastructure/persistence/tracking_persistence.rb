module Tracking
  module Infrastructure
    module Persistence
      class TrackingPersistence < SharedDomain::Infrastructure::Persistence
        self.table_name = "tracking_activities"

        has_many :tracking_events,
                 class_name: "Tracking::Infrastructure::Persistence::HandlingEventPersistence",
                 foreign_key: :tracking_activity_id
      end
    end
  end
end

