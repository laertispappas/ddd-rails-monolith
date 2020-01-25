module Booking
  class AppContainer < SharedDomain::Container
    namespace :booking do
      register(:cargo_booking_service) {
        Booking::Application::Services::CargoBookingService.new
      }
      register(:cargo_repository) {
        "TODO_CARGO_REPO"
      }
      register(:cargo_routing_service) {
        "TODO_CARGO_ROUTING_SERVICE"
      }
    end

    Inject = Dry::AutoInject(AppContainer)
  end
end

