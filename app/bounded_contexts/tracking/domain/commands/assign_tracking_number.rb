module Tracking
  module Domain
    module Commands
      class AssignTrackingNumber < Dry::Struct
        attribute :booking_id, Types::String
        attribute :tracking_number, Types::String.optional

        def set_tracking_number(number)
          attributes[:tracking_number] = number
        end
      end
    end
  end
end
