module Tracking
  module Application
    module EventHandlers
      class CargoBookedEventHandler
        include EventDispatcher

        on SharedDomain::Events::CargoBookedEvent, sync: self

        def self.call(event)
          event
        end
      end
    end
  end
end
