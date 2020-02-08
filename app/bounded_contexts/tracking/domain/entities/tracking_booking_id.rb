module Tracking
  module Domain
    module Entities
      class TrackingBookingId < Entity
        attribute :value, Types::Strict::String
      end
    end
  end
end
