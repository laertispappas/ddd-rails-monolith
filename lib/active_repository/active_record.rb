module ActiveRepository
  class ActiveRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
