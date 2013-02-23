module SessionHelpers
  def sign_in_user
    @user_info = { email: "user@example.com", password: "foobar" }
    @user = Fabricate :confirmed_user, @user_info
    visit new_user_session_path
    fill_in "Username or Email", with: @user_info[:email]
    fill_in "Password", with: @user_info[:password]
    click_button "Sign In"
  end

  def sign_in_admin
    @admin_info = { email: "admin@example.com", password: "foobar" }
    @admin = Fabricate :admin, @admin_info
    visit new_user_session_path
    fill_in "Username or Email", with: @admin_info[:email]
    fill_in "Password", with: @admin_info[:password]
    click_button "Sign In"
  end
end
