module Booking
  module Application
    module Controllers
      class CargoBookingsController < ApplicationController
        def create
          booking_id = Services::CargoBooking.new.book_cargo(book_command)

          render json: booking_id
        end

        private

        # Create a book cargo domain command for our service
        # for more complex parsing / construction we can introduce
        # DTO assemblers to transform our input to the expected
        # command paramters. In this case the parsing is simple
        # so we keep the logic in the controller. The DTO assemblers
        # are part of out application layer. Note that the command
        # belogs to the domain layer.
        #
        def book_command
          Domain::Commands::BookCargoCommand.new(
            booking_amount: params.require(:booking_amount).to_i,
            origin_location: params.require(:origin_location),
            dest_location: params.require(:dest_location),
            dest_arrival_deadline: params.require(:dest_arrival_deadline).to_datetime
          )
        end
      end
    end
  end
end
