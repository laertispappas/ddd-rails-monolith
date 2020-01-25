module SharedDomain
  module Model
    class TransitPath < ValueObject
      attribute :edges, Types::Array.of(SharedDomain::Model::TransitEdge)
    end
  end
end
