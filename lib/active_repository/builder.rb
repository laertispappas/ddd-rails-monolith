module ActiveRepository
  # Could be easier with inheritance!
  #
  class Builder < Module
    def initialize(adapter)
      @adapter = adapter
    end

    module ClassMethods
      def maps_to(entity)
        define_method :mapped_entity do
          @entity = entity
        end
      end

      def persists_to(entity)
        define_method :table_name do
          @table_name = entity
        end
      end
    end

    module InstanceMethods
      def persistence
        @persistence ||= build_persistence
      end

      private

      def build_persistence
        klass = Class.new(persistence_proxy) do
        end
        klass.table_name = table_name
        klass
      end
    end

    def included(base)
      base.extend(ClassMethods)
      base.include(InstanceMethods)

      base.include(BaseRepository)
      # set_unit_of_work(base)

      set_persistence_proxy(base, ActiveRepository::ActiveRecord)
      super
    end

    private

    def set_persistence_proxy(receiver, proxy)
      receiver.class_eval do
        define_method :persistence_proxy do
          proxy
        end
      end
    end

    def set_unit_of_work(receiver)
      receiver.class_eval do
        define_method :unit_of_work do
          @unit_of_work ||= UnitOfWork.new
        end
      end
    end
  end
end
