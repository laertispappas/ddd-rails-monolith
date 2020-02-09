module Handling
  class Container < SharedDomain::Container
    namespace :handling do
      register(:handling_activity_repository) {
        Infrastructure::Repositories::HandlingActivityRepository
      }
      register(:activity_persistence) {
        Infrastructure::Persistence::HandlingActivityPersistence
      }
    end

    Inject = Dry::AutoInject(Container)
  end
end

