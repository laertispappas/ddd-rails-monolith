module Tracking
  module Application
    module EventHandlers
      class CargoRoutedEventHandler
        include EventDispatcher

        on SharedDomain::Events::CargoRoutedEvent, sync: self

        def self.call(event)
          event
        end
      end
    end
  end
end
