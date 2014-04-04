# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to override the default site name.
   config.site_name = "groupGrant Market"
   config.allow_ssl_in_staging = false
   config.allow_ssl_in_production = false
   config.products_per_page = 15
end

Spree.user_class = "User"

          Rails.application.config.to_prepare do
            require_dependency 'spree/authentication_helpers'
          end
