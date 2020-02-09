module Handling
  module Infrastracture
    module Persistence
      class HandlingActivityPersistence < SharedDomain::Infrastructure::Persistence
        self.table_name = "jandling_activities"
      end
    end
  end
end
