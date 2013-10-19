source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '3.2.15'

gem 'haml-rails'
gem 'modernizr-rails'
gem 'zurb-foundation', "4.3.2"

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 3.2.1'
gem 'sass-rails',   '~> 3.2.3'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby

gem 'uglifier', '>= 1.0.3'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby


# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# gem 'jquery-turbolinks'

# mobile
gem 'jpmobile'

# Pjax
gem 'rack-pjax'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# DB
gem 'mongoid', '~> 3'
gem 'bson_ext'

# GridFS
gem 'carrierwave'
gem 'carrierwave-mongoid'
gem 'mongoid-grid_fs'
gem 'mini_magick'

# Geocoding
gem 'geocoder'

# Borbon Sass Plugin
gem 'bourbon'

# Use Devise to authenticate users
gem 'devise'
gem 'devise-encryptable'

# Use The Decorator Pattern
gem 'draper'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'jpmobile'

group :test do
  # Pretty printed test output
  gem 'turn', require: false
  # gem 'capybara-webkit' if RUBY_PLATFORM =~ /darwin/i # mac os x
  gem 'capybara-webkit', git: 'git@github.com:thoughtbot/capybara-webkit.git' if RUBY_PLATFORM =~ /darwin/i # mac os x
end

group :development, :test do
  gem 'fakeweb'
  gem 'rspec-rails'
  gem 'spork', '1.0.0rc3'
  gem 'capybara'
  gem 'fabrication'
  gem 'database_cleaner'
  gem 'rb-fsevent', require: false if RUBY_PLATFORM =~ /darwin/i # mac os x
  gem 'launchy'
  gem 'guard-spork'
  gem 'guard-rspec'

  # Notifiers
  case RUBY_PLATFORM
  when /linux/i
    gem 'libnotify'
  when /darwin/i
    gem 'growl'
    gem 'terminal-notifier-guard'
  when /mswin(?!ce)|mingw|cygwin|bccwin/i
    gem 'rb-notifu'
  end
end


# Deploy with Capistrano
group :deployment do
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'rvm-capistrano'
end
