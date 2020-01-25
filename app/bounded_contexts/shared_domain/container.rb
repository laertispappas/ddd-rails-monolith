module SharedDomain
  class Container
    extend Dry::Container::Mixin

    namespace :shared do
      register(:event_dispatcher) { EventDispatcher }
      register(:http_client) { HttpClient }
    end
  end
end

