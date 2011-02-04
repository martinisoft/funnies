Given /^a comic already exists$/ do
  @comic ||= Factory(:comic)
end

Given /^I am subscribed to a comic$/ do
  Given 'a comic already exists'
  When 'I go to the comics page'
  And %(I follow "Subscribe")
end
