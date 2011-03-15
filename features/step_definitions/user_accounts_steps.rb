Given /^I am signed out$/ do
  visit destroy_user_session_path
end

Given /^a confirmed user exists$/ do
  @user = Fabricate(:user)
end

Given /^I am logged in$/ do
  @user ||= Fabricate(:user)
  visit path_to('the login page')
  fill_in('user_login', :with => @user.email)
  fill_in('user_password', :with => @user.password)
  click_button('Sign In')
  page.should have_content("Signed in as #{@user.username}")
end

Then /^I should see an error on the (.*) field$/ do |fieldname|
  within(:xpath, "//li[@id='user_#{fieldname}_input']") do
    find('p.inline-errors').should_not be_nil
  end
end
