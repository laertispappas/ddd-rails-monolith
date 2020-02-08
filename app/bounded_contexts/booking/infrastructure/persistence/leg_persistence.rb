module Booking
  module Infrastructure
    module Persistence
      class LegPersistence < SharedDomain::Infrastructure::Persistence
        self.table_name = "legs"

        belongs_to :cargo, class_name: "Booking::Infrastructure::Persistence::CargoPersistence"
      end
    end
  end
end
