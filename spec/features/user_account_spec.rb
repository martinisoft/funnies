require 'spec_helper'

feature "User account" do
  scenario "User creates new account" do
    @email = "bishop@weylandindustries.com"
    visit root_path
    click_link "Sign up for a free account"

    fill_in "user_username", with: "Bishop"
    fill_in "user_email", with: @email
    fill_in "user_password", with: "secrets"
    fill_in "user_password_confirmation", with: "secrets"
    click_button "Sign me up!"

    expect(mailbox_for(@email).size).to eq 1

    open_email(@email)
    visit_in_email("confirmation")

    user = User.find_by(email: @email)
    sign_in_with(user, "secrets")
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
