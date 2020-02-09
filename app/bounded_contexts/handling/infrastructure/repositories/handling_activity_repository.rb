module Handling
  module Infrastructure
    module Repositories
      class HandlingActivityRepository < ActiveRepository::BaseRepository
        include Handling::Container::Inject[persistence: "handling.activity_persistence"]

        def get_handling_history_of_cargo(booking_id)
          handling_activities = persistence.where(booking_id: booking_id).map(&:to_entity)
          HandlingActivityHistory.new(handling_events: handling_activities)
        end

        private

        def to_entity(dao)
          Domain::HandlingActivity.new(
            event_type: "TODO",
            voyage_number: "TODO",
            location_un_loc_code: "TODO",
            completion_time: "TODO",
            cargo_booking_id: "TODO"
          )
        end
      end
    end
  end
end
