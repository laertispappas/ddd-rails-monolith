module Tracking
  module Application
    module Services
      class AssignTrackingId
        include Container::Inject[tracking_repo: "tracking.tracking_repository"]

        def assign_tracking_number_to_cargo(assign_tracking_number_command)
        end

        def add_tracking_event(add_tracking_event_command)
        end
      end
    end
  end
end
