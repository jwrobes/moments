source 'https://rubygems.org'


ruby "2.1.1"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'
# Use sqlite3 as the database for Active Record
gem 'pg'
gem 'dotenv-rails', :groups => [:development, :test]
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby


gem 'sinatra', '>=1.3.0', :require => nil

gem 'redis'

#add unicorn for heroku
gem 'unicorn'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Include Bootstrap 3.1.1.0
gem 'bootstrap-sass', '~> 3.1.1.0'

gem 'font-awesome-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

gem 'devise'

gem 'foreman'

gem 'pickadate-rails'

gem 'twilio-ruby'

gem "resque"#, require: "resque/server" 

gem 'resque-scheduler', '~>2.0.0'  '',require: 'resque_scheduler/server'

gem 'rufus-scheduler', '2.0.24'

gem 'resque-web', require: 'resque_web'

# gem 'sidekiq'

# gem 'sidetiq'

gem 'phony_rails'

# gem 'clockwork'

gem 'tzinfo'

gem 'skrollr-rails'

gem 'pry'
gem 'pry-nav'
gem 'pry-stack_explorer'

# gem 'unobtrusive_flash', '>=3'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development, :test do
  gem 'rspec-rails', '2.14'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'faker'
end

gem 'rails_12factor', group: :production