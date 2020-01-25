module Booking
  module Domain
    module Entities
      class Location < Entity
        attribute :name, Types::String
        attribute :un_loc_code, Types::String
      end
    end
  end
end
