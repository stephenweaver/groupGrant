Blankcomposer::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = false;

  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE 

  config.facebook_id = 1473382302876752;
  config.dumb_url = "";

  
end

Devise.setup do |config|
  config.omniauth :twitter, '9zijyfjZKttwj63HY0cZw', 'A9a1Cu20tHyMiWgtP4lFczRgWfKfxafh91cKtu4tU'
  config.omniauth :facebook, '1473382302876752', '66de5c33690b06edca94ba5d1bc51fe5'
end