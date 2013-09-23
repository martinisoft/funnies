require 'email_spec'

RSpec.configure do |config|
  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)
  config.before(:each) { ActionMailer::Base.deliveries.clear }
end
