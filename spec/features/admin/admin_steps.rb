steps_for :admin do
  step "an admin" do
    @admin_info = { email: "admin@example.com", password: "foobar" }
    @admin = Fabricate :admin, @admin_info
  end

  step "I am signed in as an admin" do
    step "an admin"
    visit new_user_session_path
    fill_in "Username or Email", with: @admin_info[:email]
    fill_in "Password", with: @admin_info[:password]
    click_button "Sign In"
  end
end
