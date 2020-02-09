module Routing
  module Infrastructure
    module Persistence
      class VoyagePersistence < SharedDomain::Infrastructure::Persistence
        self.table_name = "voyages"

        has_many :carrier_movements,
          class_name: "Routing::Infrastructure::Persistence::CarrierMovementPersistence",
          foreign_key: :voyage_id
      end
    end
  end
end

