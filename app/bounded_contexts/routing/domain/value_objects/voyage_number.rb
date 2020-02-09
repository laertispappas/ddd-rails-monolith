module Routing
  module Domain
    module ValueObjects
      class VoyageNumber < ValueObject
        attribute :value, Types::Strict::String
      end
    end
  end
end
