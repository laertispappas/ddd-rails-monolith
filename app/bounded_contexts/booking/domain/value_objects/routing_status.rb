module Booking
  module Domain
    module ValueObjects
      RoutingStatus = Types::String.enum("NOT_ROUTED", "ROUTED", "MISROUTED")
    end
  end
end
