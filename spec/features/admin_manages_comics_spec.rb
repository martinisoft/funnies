require 'spec_helper'

feature "Admin comic management" do
  scenario "Adding a comic" do
    @admin_info = { email: "admin@example.com", password: "foobar" }
    @admin = Fabricate :admin, @admin_info
    visit new_user_session_path
    fill_in "Username or Email", with: @admin_info[:email]
    fill_in "Password", with: @admin_info[:password]
    click_button "Sign In"
    @comic_info = { name: "xkcd" }
    click_link "Add Comic"
    fill_in "Name", with: @comic_info[:name]
    fill_in "Homepage", with: "http://xkcd.com"
    fill_in "Comic Page", with: "http://xkcd.com"
    fill_in "Title XPath", with: "id('middleContent')/div[2]/div/div/h1"
    fill_in "Image XPath", with: "id('middleContent')/div[2]/div/div//img"
    click_button "Save"
    within "article.comic" do
      expect(page).to have_content(@comic_info[:name])
    end
  end

  scenario "Editing a comic" do
    @admin_info = { email: "admin@example.com", password: "foobar" }
    @admin = Fabricate :admin, @admin_info
    visit new_user_session_path
    fill_in "Username or Email", with: @admin_info[:email]
    fill_in "Password", with: @admin_info[:password]
    click_button "Sign In"
    @comic_info = { name: "xkcd" }
    @comic = Fabricate :comic, @comic_info
    @new_comic_info = {
      name: "foobar",
      homepage: "http://example.com"
    }
    visit comics_path
    click_link "Edit Comic"
    fill_in "Name", with: @new_comic_info[:name]
    fill_in "Homepage", with: @new_comic_info[:homepage]
    click_button "Save"
    visit comics_path
    click_link "Edit Comic"
    expect(find_field("Name").value).to eq @new_comic_info[:name]
    expect(find_field("Homepage").value).to eq @new_comic_info[:homepage]
  end

  scenario "Deleting a comic" do
    @admin_info = { email: "admin@example.com", password: "foobar" }
    @admin = Fabricate :admin, @admin_info
    visit new_user_session_path
    fill_in "Username or Email", with: @admin_info[:email]
    fill_in "Password", with: @admin_info[:password]
    click_button "Sign In"
    @comic_info = { name: "xkcd" }
    @comic = Fabricate :comic, @comic_info
    visit comics_path
    click_link "Delete Comic"
    within "#content" do
      expect(page).to_not have_content(@comic_info[:name])
    end
  end
end
