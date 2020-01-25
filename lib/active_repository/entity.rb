module ActiveRepository
  module Entity
    def self.entities
      @entities = {}
    end

    def self.included(base)
      add_entity(base)
    end

    private def self.add_entity(entity)
              @entities[entity] = entity
            end
  end
end
