module Tracking
  module Domain
    module ValueObjects
      class TrackingLocation < ValueObject
        attribute :un_loc_code, Types::Strict::String
      end
    end
  end
end
