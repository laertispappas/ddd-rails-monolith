module Routing
  module Infrastructure
    module Persistence
      class CarrierMovementPersistence < SharedDomain::Infrastructure::Persistence
        self.table_name = "carrier_movements"

        belongs_to :voyage, class_name: "Routing::Infrastructure::Persistence::VoyagePersistence"
      end
    end
  end
end

