require 'spec_helper'

feature "User account" do
  scenario "User creates new account" do
    @email = "bishop@weylandindustries.com"
    visit new_user_registration_path

    fill_in "Username", with: "Bishop"
    fill_in "Email", with: @email
    fill_in "Password", with: "secrets"
    fill_in "Password confirmation", with: "secrets"
    click_button "Sign up"

    expect(mailbox_for(@email).size).to eq 1

    open_email("bishop@weylandindustries.com")
    visit_in_email("confirmation")

    expect(page).to have_link("Sign out")
  end

  scenario "Logging in" do
    @user_info = { email: "user@example.com", password: "foobar" }
    @user = Fabricate :confirmed_user, @user_info
    visit new_user_session_path
    fill_in "Username or Email", with: @user_info[:email]
    fill_in "Password", with: @user_info[:password]
    click_button "Sign In"

    expect(page).to have_link("Sign out")
  end

  scenario "Logging out" do
    @user_info = { email: "user@example.com", password: "foobar" }
    @user = Fabricate :confirmed_user, @user_info
    visit new_user_session_path
    fill_in "Username or Email", with: @user_info[:email]
    fill_in "Password", with: @user_info[:password]
    click_button "Sign In"
    click_link "Sign out"

    expect(page).to have_link("Sign in")
  end
end
