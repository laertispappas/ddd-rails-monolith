class Entity < Dry::Struct
  attribute :id, Types::String.optional.default(nil)
end
