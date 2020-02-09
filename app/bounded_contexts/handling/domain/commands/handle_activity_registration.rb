module Handling
  module Domain
    module Commands
      class HandleActivityRegistration < Dry::Struct
        attribute :completion_time, Types::DateTime
        attribute :booking_id, Types::String
        attribute :voyage_number, Types::String
        attribute :un_locode, Types::String
        attribute :handling_type, Types::String
      end
    end
  end
end
