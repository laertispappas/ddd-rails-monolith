module Tracking
  module Infrastructure
    module Repositories
      class TrackingRepository < ActiveRepository::BaseRepository
        include Tracking::Container::Inject[
                  tracking_persistence: "tracking.tracking_persistence",
                  event_persistence: "tracking.tracking_event_persistence"
                ]

        delegate :to_dao, to: Mappers::TrackingActivityMapper
        delegate :to_entity, to: Mappers::TrackingActivityMapper

        def next_tracking_number
          SecureRandom.uuid.upcase
        end

        def find_by_tracking_number(number)
          to_entity(tracking_persistence.find_by(tracking_number: number))
        end

        def find_by_booking_id(booking_id)
          to_entity(tracking_persistence.find_by(booking_id: booking_id))
        end

        private

        # Unit of work callbacks

        def persist_new(activity)
          tracking_persistence.create!(to_dao(activity))
        end

        def persist_updated(activity)
          activity.tracking_activity_events.each do |tracking_event|
            Mappers::TrackingEventMapper.to_dao(tracking_event).
              merge(tracking_activity_id: activity.id).tap do |persistence_params|
              event_persistence.create!(persistence_params)
            end
          end
        end
      end
    end
  end
end
