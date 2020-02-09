module Handling
  module Application
    module Services
      class ActivityRegistrationService
        include Handling::Container::Inject[
                  repository: "routing.handling_activity_repository",
                  event_dispatcher: "shared.event_dispatcher",
                ]

        def register_haling_activity(handle_activity_registration_cmd)
          activity = Domain::HandlingActivity.new(
            event_type: handle_activity_registration_cmd.handling_type,
            voyage_number: handle_activity_registration_cmd.voyage_number,
            location_un_loc_code: handle_activity_registration_cmd.un_locode,
            completion_time: handle_activity_registration_cmd.completion_time,
            cargo_booking_id: handle_activity_registration_cmd.booking_id
          )

          repository.store(activity)
          repository.commit!

          # TODO: Dispatch event
        end
      end
    end
  end
end
