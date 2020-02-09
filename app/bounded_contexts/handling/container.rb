module Handling
  class Container < SharedDomain::Container
    namespace :handling do
      register(:handling_activity_repository) {
        Infrastructure::Repositories::HandlingActivityRepository.new
      }
      register(:activity_persistence) {
        Infrastructure::Persistence::HandlingActivityPersistence
      }
      register(:activity_registration_service) {
        Application::Services::ActivityRegistrationService.new
      }
    end

    Inject = Dry::AutoInject(Container)
  end
end

