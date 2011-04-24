Given /^I am subscribed to a comic$/ do
  Given '1 comic'
  When 'I go to the comics page'
  And %(I follow "Subscribe")
end

Given /^I run the "([^"]*)" rake task$/ do |task_name|
  require 'rake'
  load 'Rakefile' unless Rake::Task.task_defined? task_name
  Rake::Task[task_name].invoke
end

When /^I fill in "([^"]*)" with an? (title|image) xpath$/ do |field, type|
  title_xpath = "id('middleContent')/div[2]/div/div/h1"
  image_xpath = "id('middleContent')/div[2]/div/div//img"
  if type == "title"
    fill_in field, :with => title_xpath
  elsif type == "image"
    fill_in field, :with => image_xpath
  end
end

Then /^the "([^"]*)" field should contain an? (title|image) xpath$/ do |field, type|
  title_xpath = "id('middleContent')/div[2]/div/div/h1"
  image_xpath = "id('middleContent')/div[2]/div/div//img"
  field = find_field(field)
  field_value = (field.tag_name == 'textarea') ? field.text : field.value
  if type == "title"
    assert_match(title_xpath, field_value)
  elsif type == "image"
    assert_match(image_xpath, field_value)
  end
end

Then /^(.+) a new comic strip$/ do |step|
  with_scope("a comic") do
    page.should have_xpath("//img")
  end
end
