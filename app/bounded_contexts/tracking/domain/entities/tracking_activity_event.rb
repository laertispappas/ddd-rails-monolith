module Tracking
  module Domain
    module Entities
      class TrackingActivityEvent < Entity
        EMPTY_ACTIVITY = TrackingActivityEvent.new

        attribute :tracking_events, Types::Array.of(ValueObjects::TrackingEvent)
      end
    end
  end
end
