module Routing
  class Container < SharedDomain::Container
    namespace :routing do
    end

    Inject = Dry::AutoInject(Container)
  end
end

