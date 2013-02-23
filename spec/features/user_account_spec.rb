require 'spec_helper'

feature "User account" do
  scenario "User creates new account" do
    @email = "bishop@weylandindustries.com"
    visit new_user_registration_path

    within "#new_user" do
      fill_in "Username", with: "Bishop"
      fill_in "Email", with: @email
      page.find('#user_password').set "secrets"
      fill_in "Password confirmation", with: "secrets"
      click_button "Sign up"
    end

    expect(mailbox_for(@email).size).to eq 1

    open_email("bishop@weylandindustries.com")
    visit_in_email("confirmation")

    expect(page).to have_link("Sign out")
  end

  scenario "Logging in" do
    sign_in_user
    expect(page).to have_link("Sign out")
  end

  scenario "Logging out" do
    sign_in_user
    click_link "Sign out"

    expect(page).to have_link("Sign in")
  end
end
