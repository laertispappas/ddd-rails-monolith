module Booking
  class AppContainer < SharedDomain::Container
    namespace :booking do
      register(:cargo_booking_service) {
        Booking::Application::Services::CargoBookingService.new
      }
      register(:cargo_repository) {
        Infrastructure::Repositories::CargoRepository.new
      }
      register(:cargo_routing_service) {
        Infrastructure::Services::CargoRoutingService.new
      }
    end

    Inject = Dry::AutoInject(AppContainer)
  end
end

