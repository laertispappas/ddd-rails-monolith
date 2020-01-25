module ActiveRepository
  class User
  end

  class UserRepo
    include ActiveRepository.Provide(:active_record)

    maps_to(User)
    persists_to(:users)

    def persist_new(entity)
    end

    def persist_updated(item)
    end

    def persist_deleted(entity)
    end
  end

  class UserRepoSub < UserRepo
  end
end
