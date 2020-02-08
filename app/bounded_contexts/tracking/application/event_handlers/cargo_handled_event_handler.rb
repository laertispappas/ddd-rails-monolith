module Tracking
  module Application
    module EventHandlers
      class CargoHandledEventHandler
        include EventDispatcher

        on SharedDomain::Events::CargoHandledEvent, sync: self

        def self.call(event)
          event
        end
      end
    end
  end
end
