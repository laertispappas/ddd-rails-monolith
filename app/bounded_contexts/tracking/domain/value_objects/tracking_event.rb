module Tracking
  module Domain
    module ValueObjects
      class TrackingEvent < ValueObject
        attribute :id, Types::Integer
        attribute :tracking_voyage_number, Types.Instance(Entities::TrackingVoyageNumber)
        attribute :tracking_location, Types.Instance(Entities::TrackingLocation)
        attribute :tracking_event_type, Types.Instance(Entities::TrackingEventType)
      end
    end
  end
end
