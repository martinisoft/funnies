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

  step "there is a comic" do
    @comic_info = { name: "xkcd" }
    @comic = Fabricate :comic, @comic_info
  end

  step "I edit that comic" do
    @new_comic_info = {
      name: "foobar",
      homepage: "http://example.com"
    }
    visit comics_path
    click_link "Edit Comic"
    fill_in "Name", with: @new_comic_info[:name]
    fill_in "Homepage", with: @new_comic_info[:homepage]
    click_button "Save"
  end

  step "I see the updated comic information" do
    visit comics_path
    click_link "Edit Comic"
    find_field("Name").value.should eq @new_comic_info[:name]
    find_field("Homepage").value.should eq @new_comic_info[:homepage]
  end

  step "I delete that comic" do
    visit comics_path
    click_link "Delete Comic"
  end

  step "I don't see that comic in the comics list" do
    within "#content" do
      page.should_not have_content @comic_info[:name]
    end
  end
end
