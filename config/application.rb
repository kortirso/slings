require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'carrierwave'

Bundler.require(*Rails.groups)

module Slings
    # Main App
    class Application < Rails::Application
        config.active_record.schema_format = :ruby
        config.generators do |g|
            g.test_framework :rspec, fixtures: true, views: false, view_specs: false, helper_specs: false,
                routing_specs: false, controller_specs: true, request_specs: false
            g.fixture_replacement :factory_bot, dir: 'spec/factories'
            g.stylesheets false
            g.javascripts false
            g.helper false
        end

        config.generators.system_tests = nil

        config.session_store :cookie_store
        config.middleware.use ActionDispatch::Cookies
        config.middleware.use ActionDispatch::Session::CookieStore, config.session_options
        config.middleware.use Rack::MethodOverride
        config.api_only = false
    end
end
