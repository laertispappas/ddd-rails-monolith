module Tracking
  module Domain
    module ValueObjects
      class TrackingEvent < ValueObject
        attribute :tracking_voyage_number, Types.Instance(ValueObjects::TrackingVoyageNumber)
        attribute :tracking_location, Types.Instance(ValueObjects::TrackingLocation)
        attribute :event_type, Types::Strict::String
        attribute :event_time, Types::Strict::DateTime

      end
    end
  end
end
