module Booking
  module Infrastructure
    module Persistence
      class CargoPersistence < SharedDomain::Infrastructure::Persistence
        self.table_name = "cargos"
      end
    end
  end
end
