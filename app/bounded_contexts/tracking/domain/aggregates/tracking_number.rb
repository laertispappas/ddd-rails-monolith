module Tracking
  module Domain
    module Aggregates
      class TrackingNumber
        def initialize(value: )
          @value = value
        end

        def value
          @value
        end
      end
    end
  end
end
