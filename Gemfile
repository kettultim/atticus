source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '4.2.1' # Rails core
gem 'pg', '0.18.2' # Database
gem 'devise', '3.5.1' # User Authentication
gem 'pundit', '1.0.1' # User Authorization
gem 'paperclip', '4.2.2' # File Attachments
gem 'simple_form', '3.1.0' # Nicer form field helpers
gem 'sidekiq', '3.4.1' # Queuing for background jobs and mailers
gem 'money', '6.5.1' # Easy formatting for money fields


gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
# gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'faker', '1.4.3'
  gem 'rspec-rails', '3.2.3'
  gem 'factory_girl_rails', '4.5.0'
  gem 'dotenv-rails', '2.0.1'
  gem 'pry-rails', '0.3.4'
  gem 'rspec-collection_matchers', '1.1.2'
  gem 'rspec-expect_it', '2.0.0'

  gem 'rubocop', require: false
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  # console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'timecop', '0.7.4'
  gem 'rspec-sidekiq', '2.0.0'
  gem 'shoulda-matchers', '2.8.0'
  gem 'capybara', '2.4.4'
  gem 'database_cleaner', '1.4.1'
  gem 'launchy', '2.4.3'
  gem 'simplecov', require: false
end
