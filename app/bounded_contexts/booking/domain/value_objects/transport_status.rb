module Booking
  module Domain
    module ValueObjects
      TransportStatus = Types::String.enum("NOT_RECEIVED", "IN_PORT", "ONBOARD_CARRIER", "CLAIMED", "UNKNOWN")
    end
  end
end
