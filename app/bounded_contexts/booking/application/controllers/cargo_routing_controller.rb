class CargoRoutingController < ApplicationController
  def create
    Services::CargoBookingService.new.assign_route_to_cargo(route_cargo_command)
    head :ok
  end

  private

  def route_cargo_command
    Domain::Commands::BookCargoCommand.new(
      booking_amount: params.require(:booking_amount).to_i,
    )
  end
end
