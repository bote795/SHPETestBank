source 'https://rubygems.org'

gem 'rails', '3.2.21'
ruby '2.1.5'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'pg'
gem "haml-rails", "~> 0.4.0"
gem 'haml'
# To use devise
gem 'devise'
gem 'capybara'
gem 'custom_error_message'
gem 'dropbox-sdk'
gem 'dropbox'
gem 'json'
gem 'oauth'
gem 'multipart-post'
gem "figaro"
gem 'pusher'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'execjs', '~> 2.5.2'
  gem 'therubyracer'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
# debugger is useful in development mode too
group :development, :test do
  gem 'jasmine-rails' # if you plan to use JavaScript/CoffeeScript
end

# setup Cucumber, RSpec, autotest support
group :test do
  gem 'rspec'
  gem 'rspec-rails', '2.14'
  gem 'simplecov', :require => false
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels' # basic imperative step defs
  gem 'database_cleaner' # required by Cucumber
  gem 'autotest-rails'
  gem 'factory_girl_rails' # if using FactoryGirl
  gem 'metric_fu'        # collect code metrics
end

group :production do
  gem 'rails_12factor'
end
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
