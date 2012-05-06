source 'http://rubygems.org'

# App dependent gems
gem 'carrierwave', '0.5.8'
gem 'decent_exposure', '~> 1.0.1'
gem 'devise', '~> 2.0.4'
gem 'escape_utils'
gem 'formtastic', '1.2.3'
gem 'gravatar_image_tag', '1.0.0'
gem 'haml', '~> 3.1.4'
gem 'jquery-rails'
gem 'nokogiri', '~> 1.5.0'
gem 'rails', '3.2.3'
gem 'rdiscount', '1.6.8'
gem 'responders', '~> 0.6.4'
gem 'state_machine', '1.1.2'
gem 'whenever', require: false

# Optional Gems
# pg gem for PostgreSQL Database
gem 'pg', '~> 0.13.2'
# Unicorns FTW
gem 'unicorn'
# Whiskey Disk for deployment
gem 'whiskey_disk', '0.6.24'

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'sass-rails', '~> 3.2.3'
  gem 'uglifier', '>= 1.0.3'
end

# Optional, for error capture on production
group :production, :staging do
  gem 'hoptoad_notifier'
end

group :development, :test do
  gem 'fabrication', '~> 1.2.0'
  gem 'haml-rails', '0.3.4'
  gem 'pry', '~> 0.9.9.4'
  gem 'pry-rails', '~> 0.1.6'
  gem 'rspec-rails', '~> 2.8.0'
end

group :test do
  gem 'capybara', '~> 1.1.2'
  gem 'email_spec', '~> 1.2.1'
  gem 'fivemat'
  gem 'launchy'
  gem 'shoulda-matchers', '1.0.0'
  gem 'turnip', '~> 0.3.0'
  gem 'webmock', '~> 1.8.0'
end
