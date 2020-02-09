module Handling
  module Domain
    module Commands
      class HandleActivityRegistration < Dry::Struct
        attribute :completion_time, Types::DateTime
        attribute :booking_id, Types::Strict::String
        attribute :voyage_number, Types::String
        attribute :un_locode, Types::Strict::String
        attribute :handling_type, Types::Strict::String
      end
    end
  end
end
