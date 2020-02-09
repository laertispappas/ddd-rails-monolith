module ActiveRepository
  class BaseRepository
    def unit_of_work
      @unit_of_work ||= UnitOfWork.new(ActiveRepository::ActiveRecord)
    end

    def store(entity)
      unit_of_work.register_added(entity, self)
    end

    def store!(entity)
      store!(entity)
      commit!
    end

    def update(entity)
      if entity.id.nil?
        raise "Cannot update new record"
        # or
        # store(entity)
      else
        unit_of_work.register_changed(entity, self)
      end
    end

    def remove(entity)
      unit_of_work.register_removed(entity, self)
    end

    def commit!
      unit_of_work.commit!
    end

    private

    # Callback from unit of work
    def persist_new(entity)
      raise NotImplementedError, "Abstract method"
    end

    def persist_updated(item)
      raise NotImplementedError, "Abstract method"
    end

    def persist_deleted(entity)
      raise NotImplementedError, "Abstract method"
    end
  end
end
