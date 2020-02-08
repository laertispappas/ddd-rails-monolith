module Booking
    module Infrastructure
    module Repositories
      class CargoRepository < ActiveRepository::BaseRepository

        include Booking::AppContainer::Inject[cargo_persistence: "booking.cargo_persistence"]

        def get(id)
          to_entity(cargo_persistence.find_by(id: id))
        end

        def get_by_booking_id(booking_id)
          to_entity(cargo_persistence.find_by(booking_id: booking_id))
        end

        def find_all
          cargo_persistence.all.map { |entity| to_entity(entity) }
        end

        def find_all_booking_ids
          cargo_persistence.all.map(&:booking_id).flat_map do |booking_id|
            Domain::ValueObjects::BookingId.new(value: booking_id)
          end
        end

        def next_booking_id
          SecureRandom.uuid.upcase
        end

        private

        def to_entity(dao)
          Mappers::CargoMapper.to_entity(dao)
        end

        def to_dao(entity)
          Mappers::CargoMapper.to_dao(entity)
        end

        # unit of work callbacks.

        def persist_new(entity)
          cargo_persistence.create(to_dao(entity))
        end

        def persist_updated(cargo)
          cargo_persistence.update(cargo.id, mapper.to_dao(cargo))
        end

        def persist_deleted(cargo)
          cargo_persistence.delete(cargo.id)
        end
      end
    end
  end
end
