module Handling
  module Application
    module Services
      class ActivityRegistrationService
        include Handling::Container::Inject[
                  repository: "routing.handling_activity_repository",
                  event_dispatcher: "shared.event_dispatcher",
                ]

        def register_handling_activity(handle_activity_registration_cmd)
          repository.store!(
            new_handling_activity(handle_activity_registration_cmd)
          )
          event_dispatcher.emit(
            new_cargo_handled_domain_event(handle_activity_registration_cmd)
          )
        end

        private

        def new_handling_activity(command)
          Domain::HandlingActivity.new(
            event_type: command.handling_type,
            voyage_number: command.voyage_number,
            location_un_loc_code: command.un_locode,
            completion_time: command.completion_time,
            cargo_booking_id: command.booking_id
          )
        end

        def new_cargo_handled_domain_event(command)
          SharedDomain::Events::CargoHandledEvent.new(
            booking_id: command.booking_id,
            handling_completion_time: command.completion_time,
            handling_location: command.un_locode,
            handling_type: command.handling_type,
            voyage_number: command.voyage_number)
        end
      end
    end
  end
end
