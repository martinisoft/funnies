source 'http://rubygems.org'

# App dependent gems
gem 'carrierwave'
gem 'decent_exposure'
gem 'devise'
gem 'escape_utils'
gem 'formtastic', '1.2.3'
gem 'haml'
gem 'haml-rails'
# My Nokogiri brings all the comics to the yard!
gem 'nokogiri'
gem 'rails', '3.0.5'
gem 'responders'
gem 'state_machine', '0.9.4'

# Optional Gems
# pg gem for PostgreSQL Database
gem 'pg'
# Whiskey Disk for deployment
gem 'whiskey_disk'

# Optional, for error capture on production
group :production, :staging do
  gem 'hoptoad_notifier'
end

group :development do
  gem 'rspec-rails', '2.3.0'
end

group :test do
  gem 'rspec', '2.3.0'
  gem 'shoulda', '2.11.2'
  gem 'cucumber-rails'
  gem 'capybara', '0.3.9'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'email_spec', '~> 1.1.1'
  gem 'fuubar'
  gem 'fuubar-cucumber'
end

group :development, :test do
  gem 'fabrication'
  gem 'ruby-debug19', :require => 'ruby-debug'
end
