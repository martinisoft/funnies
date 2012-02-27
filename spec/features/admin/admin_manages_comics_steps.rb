steps_for :admin_manages_comics do
  use_steps :admin

  step "I add a comic" do
    @comic_info = { name: "xkcd" }
    click_link "Add Comic"
    fill_in "Name", with: @comic_info[:name]
    fill_in "Homepage", with: "http://xkcd.com"
    fill_in "Comic Page", with: "http://xkcd.com"
    fill_in "Title XPath", with: "id('middleContent')/div[2]/div/div/h1"
    fill_in "Image XPath", with: "id('middleContent')/div[2]/div/div//img"
    click_button "Save"
  end

  step "I see that new comic in the comics list" do
    within "article.comic" do
      page.should have_content @comic_info[:name]
    end
  end
end
