module Tracking
  module Domain
    module Entities
      class TrackingActivityEvent < Entity
        DEFAULT_COLLECTION = [].freeze

        attribute :tracking_events, Types::Array.of(ValueObjects::TrackingEvent).
          optional.default(DEFAULT_COLLECTION)

        def add(event)
          tracking_events << event
        end

        def size
          tracking_events.size
        end

        EMPTY_ACTIVITY = TrackingActivityEvent.new(tracking_events: DEFAULT_COLLECTION)
      end
    end
  end
end
