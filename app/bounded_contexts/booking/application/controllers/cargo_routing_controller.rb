module Booking
  module Application
    module Controllers
      class CargoRoutingController < ApplicationController
        def create
          Services::CargoBooking.new.assign_route_to_cargo(route_cargo_command)
          head :ok
        end

        private

        def route_cargo_command
          Domain::Commands::RouteCargoCommand.new(
            booking_id: params.require(:booking_id),
            )
        end
      end
    end
  end
end
