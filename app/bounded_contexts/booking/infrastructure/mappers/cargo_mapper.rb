module Booking
  module Infrastructure
    module Mappers
      module CargoMapper
        module_function

        def to_entity(dao)
        end

        def to_dao(entity)
          {
            booking_id: entity.booking_id&.value,
            booking_amount: entity.booking_amount.value,
            transport_status: "TODO",
            routing_status: "TODO",
          }
        end
      end
    end
  end
end
