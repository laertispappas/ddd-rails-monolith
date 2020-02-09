module Handling
  module Domain
    class HandlingActivityHistory < ValueObject
      attribute :handling_events, Types::Array.of(HandlingActivity)
    end
  end
end
