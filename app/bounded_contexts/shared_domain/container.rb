module SharedDomain
  class Container
    extend Dry::Container::Mixin

    namespace :shared do
      register(:event_dispatcher) { "TODO" }
    end
  end
end

