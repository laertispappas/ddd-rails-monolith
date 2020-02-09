module Routing
  module Infrastructure
    module Persistence
      class VoyagePersistence < SharedDomain::Infrastructure::Persistence
        self.table_name = "voyages"
      end
    end
  end
end

