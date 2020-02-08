module Booking
    module Infrastructure
    module Repositories
      class CargoRepository
        include ActiveRepository.Provide(:active_record)

        mapper(Mappers::CargoMapper)
        persists_to(:cargos)

        def get(id)
          mapper.to_entity(persistence.find_by(id: id))
        end

        def get_by_booking_id(booking_id)
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
          persistence.create(mapper.to_dao(entity))
        end

        def persist_updated(cargo)
          persistence.update(cargo.id, mapper.to_dao(cargo))
        end

        def persist_deleted(cargo)
          persistence.delete(cargo.id)
        end
      end
    end
  end
end
