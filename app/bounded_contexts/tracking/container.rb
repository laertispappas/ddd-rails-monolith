module Tracking
  class Container < SharedDomain::Container
    namespace :tracking do
      register(:tracking_repository) {
        Infrastructure::Repositories::TrackingRepository.new
      }
      register(:tracking_persistence) {
        Infrastructure::Persistence::TrackingPersistence
      }
      register(:tracking_event_persistence) {
        Infrastructure::Persistence::HandlingEventPersistence
      }
    end

    Inject = Dry::AutoInject(Container)
  end
end

