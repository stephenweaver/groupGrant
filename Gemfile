source 'http://rubygems.org'
ruby '1.9.3'
gem 'rails', '4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails', '~> 3.1.0'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass', '~> 3.0.2.0'
gem 'bootstrap-datepicker-rails'
gem 'figaro'
gem 'high_voltage'
gem 'simple_form', '>= 3.0.0.rc'
gem 'thin'
gem 'devise'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'twitter'
gem 'fb_graph'
gem 'nifty-generators'
gem 'binding_of_caller'
gem  'money', '~> 5.1.1'
gem 'heroku'
gem 'paperclip',  '~> 3.4.1'
gem 'auto_html'
gem 'sqlite3'
gem "skrollr-rails"
gem 'spree', git: 'https://github.com/spree/spree.git', branch: '2-1-stable'
gem 'spree_gateway', git: 'https://github.com/spree/spree_gateway.git'
gem 'spree_simple_sales', :path => 'spree_simple_sales'
gem "stripe", '~> 1.10.1'

group :development do
  gem 'better_errors'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'meta_request'
end

#gem "mocha", group: :test

group :production do
  # To not install production gems, run `bundle install --without production`
  # That setting will be saved so you can run just `bundle install` in the future
  gem 'pg'
  gem 'rails_12factor'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', platforms: :ruby
  gem 'mysql2', '0.3.11'
end
