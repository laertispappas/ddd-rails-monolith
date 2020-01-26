module Booking
    module Infrastructure
    module Repositories
      class CargoRepository
        include ActiveRepository.Provide(:active_record)

        mapper(Mappers::CargoMapper)
        persists_to(:cargos)

        def get(booking_id)
          mapper.to_entity(persistence.find_by(booking_id: booking_id))
        end

        def find_all
          persistence.all.map { |entity| mapper.to_entity(entity) }
        end

        def find_all_booking_ids
          persistence.all.map(&:booking_id).flat_map do |booking_id|
            Domain::ValueObjects::BookingId.new(value: booking_id)
          end
        end

        def next_booking_id
          SecureRandom.uuid.upcase
        end

        private

        # unit of work callbacks.

        def persist_new(entity)
          cargo = Domain::Aggregates::Cargo.new(
            booking_id: Domain::ValueObjects::BookingId.new(value: "aaa"),
            booking_amount: Domain::ValueObjects::BookingAmount.new(value: 100),
            route_specification: Domain::ValueObjects::RouteSpecification.new(
              origin: Domain::Entities::Location.new(name: "spec_origin_name", un_loc_code: "spec_origin_un_loc_code"),
              destination: Domain::Entities::Location.new(
                name: "spec_destin_name", un_loc_code: "spec_destin_un_loc_code"),
              arrival_deadline: Time.now.to_datetime
            ),
            cargo_itinerary: Domain::ValueObjects::CargoItinerary.new(legs: []),
            delivery: nil,
            location: Domain::Entities::Location.new(name: "name", un_loc_code: "un_loc_code"))

          persistence.create(mapper.to_dao(cargo))
        end
      end
    end
  end
end
