module Booking
  class AppContainer < SharedDomain::Container
    namespace :booking do
      register(:cargo_booking_service) {
        Booking::Application::Services::CargoBooking.new
      }
      register(:cargo_repository) {
        Infrastructure::Repositories::CargoRepository.new
      }

      register(:external_cargo_routing_service) {
        Booking::Application::Services::ExternalCargoRouting.new
      }

      register(:external_cargo_routing_service_client) {
        Booking::Infrastructure::Services::ExternalCargoRoutingServiceClient.new
      }

      register(:cargo_persistence) {
        Booking::Infrastructure::Persistence::CargoPersistence
      }

      register(:leg_persistence) {
        Booking::Infrastructure::Persistence::LegPersistence
      }
    end

    Inject = Dry::AutoInject(AppContainer)
  end
end

