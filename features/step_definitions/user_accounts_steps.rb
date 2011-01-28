Given /^I am not authenticated$/ do
  visit destroy_user_session_path
end

Given /^a confirmed user exists$/ do
  @user = Factory(:user)
end

Given /^I am logged in$/ do
  @user ||= Factory(:user)
  visit path_to('the login page')
  fill_in('user_login', :with => @user.email)
  fill_in('user_password', :with => @user.password)
  click_button('Sign in')
  page.should have_content("Signed in as #{@user.username}")
end
