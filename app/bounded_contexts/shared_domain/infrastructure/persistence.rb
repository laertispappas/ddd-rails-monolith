module SharedDomain
  module Infrastructure
    class Persistence < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
