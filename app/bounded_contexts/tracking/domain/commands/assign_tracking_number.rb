module Tracking
  module Domain
    module Commands
      class AssignTrackingNumber < Dry::Struct
        attribute :booking_id, Types::String
        attribute :tracking_number, Types::String
      end
    end
  end
end
