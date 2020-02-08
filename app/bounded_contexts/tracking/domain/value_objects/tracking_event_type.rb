module Tracking
  module Domain
    module ValueObjects
      class TrackingEventType < ValueObject
        attribute :event_type, Types::Strict::String
        attribute :event_time, Types::Strict::String
      end
    end
  end
end
