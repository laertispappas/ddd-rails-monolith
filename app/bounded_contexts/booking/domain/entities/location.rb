module Booking
  module Domain
    module Entities
      class Location < Entity
        attribute :name, :string
        attribute :un_loc_code, :string
      end
    end
  end
end
