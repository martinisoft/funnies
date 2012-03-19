steps_for :visitor_views_public_pages do
  step "I am a site visitor" do
    #noop
  end

  step "I visit the :page" do |page|
    locations = {
      "landing" => root_path,
      "about" => about_path,
      "copyright" => copyright_path
    }
    visit locations[page]
  end

  step "I see a link to sign up" do
    page.should have_link "Sign up"
  end

  step "I see the backstory to Funnies" do
    page.should have_content "The story"
  end

  step "I see information about copyrights" do
    page.should have_content "DMCA Takedowns"
  end

  placeholder :page do
    match /(\w+) page/ do |location|
      location
    end
  end
end
