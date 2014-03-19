# `bundle install --without production` will avoid
# installing gems from the production group
# That setting will be saved so you can run just 
# `bundle install` in the future

# All gems have been at least loosely versioned so 
# that an unexpected update doesn't break anything
# in the last month of development. Run the command
# `bundle outdated` to see which gems could be updated
# and test on your system before changing the version
# number here.

source 'http://rubygems.org'

ruby '1.9.3'
gem 'rails', '4.0.0'

gem 'auto_html',                  '~> 1.6.1'
# gem 'binding_of_caller',          '~> 0.7.2'
gem 'bootstrap-datepicker-rails', '~> 1.3.0.1'
gem 'bootstrap-sass',             '~> 3.0.2.0'
gem 'coffee-rails',               '~> 4.0.0'
gem 'devise',                     '~> 3.2.3'
gem 'fb_graph',                   '~> 2.7.10'
gem 'figaro',                     '~> 0.7.0'
gem 'high_voltage',               '~> 2.1.0'
gem 'jbuilder',                   '~> 1.2'
gem 'jquery-rails',               '~> 3.1.0'
gem 'money',                      '~> 5.1.1'
gem 'nifty-generators',           '~> 0.4.6'
gem 'omniauth-facebook',          '~> 1.6.0'
gem 'omniauth-twitter',           '~> 1.0.1'
gem 'paperclip',                  '~> 3.4.1'
gem 'sass-rails',                 '~> 4.0.0'
gem 'simple_form',                '>= 3.0.0.rc'
gem 'skrollr-rails',              '~> 0.6.21'
gem 'spree',                      '~> 2.1.4'
gem 'spree_gateway',              '~> 2.1.1'
gem 'spree_simple_sales',         '~> 2.1.4',    :path => 'spree_simple_sales'
gem 'stripe',                     '~> 1.10.1'
gem 'thin',                       '~> 1.6.2'
gem 'turbolinks',                 '~> 2.2.1'
gem 'twitter',                    '~> 5.7.1'
gem 'uglifier',                   '>= 1.3.0'
# gem 'mysql2',                     '0.3.11'

gem 'better_errors'
gem 'binding_of_caller'
gem 'meta_request'

group :development do
  # gem 'better_errors',            '~> 1.1.0'
  gem 'guard-bundler',            '~> 2.0.0'
  gem 'guard-rails',              '~> 0.5.0'
  gem 'hub',                      '~> 1.12.0',   :require=>nil
  # gem 'meta_request',             '~> 0.2.8'
  gem 'quiet_assets',             '~> 1.0.2'
  gem 'rails_layout',             '~> 1.0.10'
  gem 'rb-fchange',               '~> 0.0.6',    :require=>false
  gem 'rb-fsevent',               '~> 0.9.4',    :require=>false
  gem 'rb-inotify',               '~> 0.9.3',    :require=>false
  gem 'sqlite3',                  '~> 1.3.9'
end

group :production do
  gem 'mysql2',                   '0.3.11'
  gem 'pg',                       '~> 0.17.1'
  gem 'rails_12factor',           '~> 0.0.2'
  gem 'therubyracer',             '~> 0.12.1',   platforms: :ruby
end
