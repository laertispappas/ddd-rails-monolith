module Tracking
  module Application
    module Services
      class AssignTrackingId
        include Container::Inject[tracking_repo: "tracking.tracking_repository"]

        def assign_tracking_number_to_cargo(assign_tracking_number_command)
          tracking_number = tracking_repo.next_tracking_number
          assign_tracking_number_command.set_tracking_number(tracking_number)
          activity = Domain::Aggregates::TrackingActivity.from_command(assign_tracking_number_command)

          tracking_repo.store(activity)
          tracking_repo.commit!

          Domain::Aggregates::TrackingNumber.new(value: tracking_number)
        end

        def add_tracking_event(add_tracking_event_command)
          tracking_activity = tracking_repo.find_by_booking_id(
            add_tracking_event_command.booking_id
          )

          tracking_activity.add_tracking_event(add_tracking_event_command)
          tracking_repo.update(tracking_activity)
          tracking_repo.commit!
        end
      end
    end
  end
end
