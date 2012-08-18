SpikesFocusFramework::Application.configure do
  config.cache_classes = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_assets = false
  config.assets.compress = true
  config.assets.compile = true
  config.assets.digest = true
  config.assets.initialize_on_precompile = false

  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify

  config.assets.precompile += %w(application-ie.css application-pre.js)
  config.ember.variant = :production
end
