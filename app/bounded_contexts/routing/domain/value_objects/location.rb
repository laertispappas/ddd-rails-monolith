module Routing
  module Domain
    module ValueObjects
      class Location < ValueObject
        attribute :un_loc_code, Types::Strict::String
      end
    end
  end
end
