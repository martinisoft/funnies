source 'http://rubygems.org'

# App dependent gems
gem 'carrierwave'
gem 'decent_exposure', '~> 1.0.1'
gem 'devise'
gem 'escape_utils'
gem 'formtastic', '1.2.3'
gem 'gravatar_image_tag', '1.0.0'
gem 'haml', '3.1.2'
gem 'nokogiri', '~> 1.5.0'
gem 'rails', '3.0.9'
gem 'rdiscount', '1.6.8'
gem 'responders', '~> 0.6.4'
gem 'sass', '3.1.3'
gem 'state_machine', '0.9.4'

# Optional Gems
# pg gem for PostgreSQL Database
gem 'pg', '0.11.0'
# Unicorns FTW
gem 'unicorn'
# Whiskey Disk for deployment
gem 'whiskey_disk', '0.6.22'

# Optional, for error capture on production
group :production, :staging do
  gem 'hoptoad_notifier'
end

group :development, :test do
  gem 'cucumber-rails', '~> 1.1.1'
  gem 'fabrication', '~> 1.2.0'
  gem 'haml-rails', '0.3.4'
  gem 'pry'
  gem 'rspec-rails', '>= 2.5.0'
end

group :test do
  gem 'database_cleaner'
  gem 'email_spec', '~> 1.1.1'
  gem 'fuubar'
  gem 'launchy'
  gem 'shoulda', '2.11.2'
end
