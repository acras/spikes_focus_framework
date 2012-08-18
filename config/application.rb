require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "sprockets/railtie"

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  Bundler.require(:default, :assets, Rails.env)
end

module SpikesFocusFramework
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: false,
        view_specs: false,
        controller_specs: false,
        helper_specs: false
      g.assets false
      g.helpers false
      g.javascripts false
      g.styleshees false
    end

    config.autoload_paths += %W(#{config.root}/lib)
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_record.schema_format = :sql

    config.assets.enabled = true
    config.assets.initialize_on_precompile = false
    config.assets.version = '1.0'
    config.handlebars.templates_root = 'templates'
  end
end
