require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Asoban
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.middleware.insert_before(Rack::Sendfile, Rack::Deflater)
    config.i18n.default_locale = :es

    config.to_prepare do
      Devise::SessionsController.layout "dashboard"
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "dashboard" : "dashboard" }
      #Devise::ConfirmationsController.layout "dashboard"
      #Devise::UnlocksController.layout "dashboard"            
      #Devise::PasswordsController.layout "dashboard"        
    end

  end
end
