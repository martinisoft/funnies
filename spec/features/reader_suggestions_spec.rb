require 'spec_helper'

feature "Reader suggestions" do
  scenario "Suggesting a comic" do
    @user_info = { email: "user@example.com", password: "foobar" }
    @user = Fabricate :confirmed_user, @user_info
    visit new_user_session_path
    fill_in "Username or Email", with: @user_info[:email]
    fill_in "Password", with: @user_info[:password]
    click_button "Sign In"
    visit comics_path
    click_link "Suggest a comic"
    fill_in "Name", with: "Dominic Deegan"
    fill_in "Website", with: "http://www.dominic-deegan.com/"
    fill_in "Reason to add this comic", with: "It rocks!"
    click_button "Submit"
    expect(page).to have_content("Thank you for suggesting a comic!")
  end
end
