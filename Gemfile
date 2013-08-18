source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

gem 'haml-rails'
gem 'modernizr-rails'

# Use SCSS for stylesheets
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'sass-rails', '~> 4.0.0'
gem 'zurb-foundation', github: 'zurb/foundation'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

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
gem 'mongoid', github: 'mongoid/mongoid'
gem 'bson_ext'

# Geocoding
gem 'geocoder'

# Borbon Sass Plugin
gem 'bourbon'

# Use Devise to authenticate users
gem 'devise', github: 'plataformatec/devise'

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

# GridFS
gem 'carrierwave'
gem 'carrierwave-mongoid', github: 'carrierwaveuploader/carrierwave-mongoid'
gem 'mongoid-grid_fs', github: 'ahoward/mongoid-grid_fs'
gem 'mini_magick'

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
