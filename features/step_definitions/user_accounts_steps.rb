Given /^I am not authenticated$/ do
  visit destroy_user_session_path
end
