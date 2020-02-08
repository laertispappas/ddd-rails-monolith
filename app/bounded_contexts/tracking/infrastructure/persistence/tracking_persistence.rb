module Tracking
  module Infrastructure
    module Persistence
      class TrackingPersistence < SharedDomain::Infrastructure::Persistence
        self.table_name = "TODO"
      end
    end
  end
end
