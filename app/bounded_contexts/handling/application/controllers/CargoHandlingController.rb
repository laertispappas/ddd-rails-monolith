module Handling
  module Application
    module Controllers
      class CargoHandlingController < SharedDomain::Application::Controllers::ApplicationController
        include Handling::Container::Inject[
                  activity_registration_service: "handling.activity_registration_service"
                ]

        # POST /cargo_handling
        def create
          activity_registration_service.register_handling_activity(
            handle_activity_registration_command
          )
        end

        private

        def handle_activity_registration_command
          Domain::Commands::HandleActivityRegistration.new(
            completion_time: "",
            booking_id: "",
            voyage_number: "",
            un_locode: "",
            handling_type: ""
          )
        end
      end
    end
  end
end
