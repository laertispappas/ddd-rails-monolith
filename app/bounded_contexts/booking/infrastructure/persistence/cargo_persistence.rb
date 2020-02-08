module Booking
  module Infrastructure
    module Persistence
      class CargoPersistence < SharedDomain::Infrastructure::Persistence
        self.table_name = "cargos"

        has_many :legs,
                 class_name: "Booking::Infrastructure::Persistence::LegPersistence",
                 foreign_key: :cargo_id
      end
    end
  end
end
