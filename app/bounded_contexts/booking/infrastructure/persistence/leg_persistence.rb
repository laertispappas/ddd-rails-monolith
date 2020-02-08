module Booking
  module Infrastructure
    module Infrastructure
      class LegPersistence < SharedDomain::Infrastructure::Persistence
        self.table_name = "legs"
      end
    end
  end
end
