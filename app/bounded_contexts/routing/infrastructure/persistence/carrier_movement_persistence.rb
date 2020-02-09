module Routing
  module Infrastructure
    module Persistence
      class CarrierMovementPersistence < SharedDomain::Infrastructure::Persistence
        self.table_name = "carrier_movements"
      end
    end
  end
end

