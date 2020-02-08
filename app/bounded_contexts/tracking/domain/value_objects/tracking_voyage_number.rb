module Tracking
  module Domain
    module ValueObjects
      class TrackingVoyageNumber < ValueObject
        attribute :value, Types::Strict::String
      end
    end
  end
end
