module Booking
    module Infrastructure
    module Repositories
      class CargoRepository
        include ActiveRepository.Provide(:active_record)

        maps_to(Domain::Aggregates::Cargo)
        persists_to(:cargos)

        def store(cargo)
          super(cargo)
          commit!
        end

        def find_all
          # (entity_manage | unit_of_work).find_all(query)
        end

        def find_all_booking_ids
          # TODO
        end

        def next_booking_id
          SecureRandom.uuid.upcase
        end

        # unit of work callbacks.

        def persist_new(entity)
          persistence.create(entity)
        end
      end
    end
  end
end
