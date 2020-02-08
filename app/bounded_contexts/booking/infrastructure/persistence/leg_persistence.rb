module Booking
  module Infrastructure
    module Persistence
      class LegPersistence < SharedDomain::Infrastructure::Persistence
        self.table_name = "legs"
      end
    end
  end
end
