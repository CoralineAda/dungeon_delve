require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module DungeonDelve
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib)
  end
end
