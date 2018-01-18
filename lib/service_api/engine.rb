module ServiceApi
  class Engine < ::Rails::Engine
    isolate_namespace ServiceApi

    config.app_generators.test_framework :rspec
  end
end
