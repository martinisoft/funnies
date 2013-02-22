require 'spec_helper'

feature "Reader subscriptions" do
  scenario "Reader subscribes" do
    @user_info = { email: "user@example.com", password: "foobar" }
    @user = Fabricate :confirmed_user, @user_info
    @comic = Fabricate :comic
    visit new_user_session_path
    fill_in "Username or Email", with: @user_info[:email]
    fill_in "Password", with: @user_info[:password]
    click_button "Sign In"
    visit comics_path
    click_link "Subscribe"
    visit user_comics_path(@user)
    within "article.comic" do
      expect(page).to have_content(@comic.name)
    end
  end

  scenario "Reader unsubscribes" do
    @user_info = { email: "user@example.com", password: "foobar" }
    @user = Fabricate :confirmed_user, @user_info
    @comic = Fabricate :comic
    visit new_user_session_path
    fill_in "Username or Email", with: @user_info[:email]
    fill_in "Password", with: @user_info[:password]
    click_button "Sign In"
    visit comics_path
    click_link "Subscribe"
    click_link "Unsubscribe"
    visit user_comics_path(@user)
    expect(page).to_not have_css("article.comic")
    visit comics_path
    within "article.comic" do
      expect(page).to have_content(@comic.name)
    end
    within ".comic_nav" do
      expect(page).to have_link("Subscribe")
    end
  end
end
