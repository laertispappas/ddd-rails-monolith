module Tracking
  module Application
    module EventHandlers
      class CargoHandledEventHandler
        include EventDispatcher

        module TrackingActivityEventAssembler
          def self.to_command_from_event(event)
            Domain::Commands::AddTrackingEvent.new(
              booking_id: event.booking_id,
              event_time: event.handling_completion_time,
              event_type: event.handling_type,
              location: event.handling_location,
              voyage_number: event.voyage_number
            )
          end
        end

        on SharedDomain::Events::CargoHandledEvent, sync: self

        def self.call(event)
          Tracking::Container["tracking.assign_tracking_id_service"].add_tracking_event(
            TrackingActivityEventAssembler.to_command_from_event(event)
          )
        end
      end
    end
  end
end
