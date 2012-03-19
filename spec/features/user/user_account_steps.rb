steps_for :user_account do
  step "I am on the registration page" do
    visit new_user_registration_path
  end

  step "I signup with valid information" do
    fill_in "Username", with: "Bishop"
    fill_in "Email", with: "bishop@weylandindustries.com"
    fill_in "Password", with: "secrets"
    fill_in "Password confirmation", with: "secrets"
    click_button "Sign up"
  end

  step "I should receive a confirmation email" do
    mailbox_for("bishop@weylandindustries.com").size.should eq 1
  end

  step "I confirm my account" do
    open_email("bishop@weylandindustries.com")
    visit_in_email("confirmation")
  end

  step "I should be signed in" do
    page.should have_link("Sign out")
  end

  step "a confirmed user" do
    @user_info = { email: "user@example.com", password: "foobar" }
    @user = Fabricate :confirmed_user, @user_info
  end

  step "I am on the sign in page" do
    visit new_user_session_path
  end

  step "I fill in my credentials" do
    fill_in "Username or Email", with: @user_info[:email]
    fill_in "Password", with: @user_info[:password]
    click_button "Sign In"
  end

  step "I am logged in as a confirmed user" do
    step "a confirmed user"
    step "I am on the sign in page"
    step "I fill in my credentials"
  end

  step "I sign out" do
    click_link "Sign out"
  end

  step "I should be signed out" do
    page.should have_link("Sign in")
  end
end
