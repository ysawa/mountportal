require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

require "mongoid"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Mountportal
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += %W(#{config.root}/lib #{config.root}/app/lib)

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Tokyo'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.default_locale = :ja

    config.generators.stylesheet_engine = :sass

    # use Pjax
    config.middleware.use Rack::Pjax

    require 'serve_gridfs_data'
    config.middleware.use "ServeGridfsData"

    if Rails.configuration.respond_to?(:sass)
      Rails.configuration.sass.tap do |config|
        config.preferred_syntax = :sass
      end
    end
    config.assets.enabled = true
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif *.svg)

    config.generators do |g|
      g.test_framework :rspec, fixture: false, views: true, requests: true, routing: true, helpers: true
      g.fixture_replacement :fabrication, dir: 'spec/fabricators'
      g.helper false
      g.stylesheets false
      g.javascripts false
    end
  end
end
