module ActiveRepository
  class UnitOfWork
    def initialize
      set_init!
    end

    def register_added(entity, repository)
      added_entities[entity] = repository
    end

    def register_changed(entity, repository)
      changed_entities[entity] = repository
    end

    def register_removed(entity, repository)
      deleted_entities[entity] = repository
    end

    def commit!
      # TODO: open transaction
      deleted_entities.each do |entity, repo|
        repo.persist_deleted(entity)
      end

      added_entities.each do |entity, repo|
        repo.persist_new(entity)
      end

      changed_entities.each do |entity, repo|
        repo.persist_updated(entity)
      end

      set_init!
    end

    private

    attr_reader :added_entities, :changed_entities, :deleted_entities

    def set_init!
      @deleted_entities = {}
      @added_entities = {}
      @changed_entities = {}
    end
  end
end
