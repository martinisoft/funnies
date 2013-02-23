require 'spec_helper'

feature "Reader subscriptions" do
  scenario "Reader subscribes" do
    sign_in_user
    @comic = Fabricate :comic
    visit comics_path
    click_link "Subscribe"
    visit user_comics_path(@user)
    within "article.comic" do
      expect(page).to have_content(@comic.name)
    end
  end

  scenario "Reader unsubscribes" do
    sign_in_user
    @comic = Fabricate :comic
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
