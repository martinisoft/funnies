Given /^a comic already exists$/ do
  @comic ||= Factory(:comic)
end

Given /^I am subscribed to a comic$/ do
  Given 'a comic already exists'
  When 'I go to the comics page'
  And %(I follow "Subscribe")
end

When /^I fill in "([^"]*)" with an? (title|image) xpath$/ do |field, type|
  title_xpath = "id('middleContent')/div[2]/div/div/h1"
  image_xpath = "id('middleContent')/div[2]/div/div/img"
  if type == "title"
    fill_in field, :with => title_xpath
  elsif type == "image"
    fill_in field, :with => image_xpath
  end
end

Then /^the "([^"]*)" field should contain an? (title|image) xpath$/ do |field, type|
  title_xpath = "id('middleContent')/div[2]/div/div/h1"
  image_xpath = "id('middleContent')/div[2]/div/div/img"
  field = find_field(field)
  field_value = (field.tag_name == 'textarea') ? field.text : field.value
  if type == "title"
    assert_match(title_xpath, field_value)
  elsif type == "image"
    assert_match(image_xpath, field_value)
  end
end

Then /^(.+) a new comic$/ do |step|
  with_scope("div.comic") do
    page.should have_xpath("//img")
  end
end
