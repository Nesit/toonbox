require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module Toonbox
  class Application < Rails::Application
    config.i18n.default_locale = :ru
    config.i18n.fallbacks = true

    config.encoding = "utf-8"
    config.autoload_paths += %W(#{config.root}/extras)
    config.assets.enabled = true
    config.assets.precompile += Ckeditor.assets
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    config.assets.precompile += %w(ckeditor/*)
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.active_record.whitelist_attributes = true
    config.assets.enabled = true
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
    config.assets.version = '1.0'

    # Some extra stuff
    config.generators.stylesheets = false
    config.generators.javascripts = false
  end
end
