module Routing
  class Container < SharedDomain::Container
    namespace :routing do
      register(:cargo_routing_query) {
        Application::Queries::CargoRoutingQuery.new
      }
      register(:voyage_repository) {
        Infrastructure::Repositories::VoyageRepository.new
      }

      register(:voyage_persistence) {
        Infrastructure::Persistence::VoyagePersistence
      }

      register(:carrier_movement_persistence) {
        Infrastructure::Persistence::CarrierMovementPersistence
      }
    end

    Inject = Dry::AutoInject(Container)
  end
end

