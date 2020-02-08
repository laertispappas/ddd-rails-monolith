module Tracking
  module Domain
    module Aggregates
      class TrackingNumber < ValueObject
        attribute :value, Types::Strict::String
      end
    end
  end
end
