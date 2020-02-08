module Tracking
  module Domain
    module ValueObjects
      class TrackingEvent < ValueObject
        attribute :id, Types::Integer
        attribute :tracking_voyage_number, Types.Instance(ValueObjects::TrackingVoyageNumber)
        attribute :tracking_location, Types.Instance(ValueObjects::TrackingLocation)
        attribute :tracking_event_type, Types.Instance(ValueObjects::TrackingEventType)
      end
    end
  end
end
