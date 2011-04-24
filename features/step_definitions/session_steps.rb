Given /^I am signed in as the following (\w+):$/ do |role, table|
  Given %(the following #{role}:), table
  @me = @it
  Given 'I am signed in'
end

Given /^I (?:am signed|sign) in as an? (\w+)$/ do |role|
  @me ||= Fabricate(role.to_sym)
  Given 'I am signed in'
end

Given 'I am signed in' do
  @me ||= Fabricate(:user)
  When %(I go to the new user session page)
  When %(I fill in "Username or Email" with "#{@me.email}")
  When %(I fill in "Password" with "#{@me.password}")
  When %(I press "Sign In")
end

When /^I sign in as "([^"]*)"$/ do |email|
  @me = User.find_by_email(email)
  @me.password ||= 'foobar'
  Given 'I am signed in'
end

Then /^I am redirected to "([^"]+)"$/ do |path|
  URI.parse(current_url).path.should == path
end

