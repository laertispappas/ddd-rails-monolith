module Handling
  module Application
    module Queries
      class ActivityHistoryQuery
        include Handling::Container::Inject[repository: "routing.handling_activity_repository"]

        def all(booking_id)
          repository.get_handling_history_of_cargo(booking_id)
        end
      end
    end
  end
end
