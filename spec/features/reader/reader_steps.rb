steps_for :reader do
  use_steps :user_account

  step "I am signed in as a reader" do
    step "I am logged in as a confirmed user"
  end
end
