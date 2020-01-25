module Booking
  module Infrastructure
    module Repositories
      class CargoRepository

        def store(cargo)
          # (entity_manage | unit_of_work).persist(cargo) ?
          # (entity_manage | unit_of_work).commit ?
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
      end
    end
  end
end
