module Booking
  class AppContainer < SharedDomain::Container
    namespace :booking do
      register(:cargo_booking_service) {
        Booking::Application::Services::CargoBookingService.new
      }
      register(:cargo_repository) {
        Infrastructure::Repositories::CargoRepository.new
      }

      register(:external_cargo_routing_service) {
        Booking::Application::Services::ExternalCargoRoutingService.new
      }

      register(:external_cargo_routing_service_client) {
        Booking::Infrastructure::Services::ExternalCargoRoutingServiceClient.new
      }
    end

    Inject = Dry::AutoInject(AppContainer)
  end
end

