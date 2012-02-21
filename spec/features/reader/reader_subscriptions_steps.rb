steps_for :reader_subscriptions do
  use_steps :user_account

  step "I am signed in as a reader" do
    step "I am logged in as a confirmed user"
  end

  step "there is a comic to subscribe to" do
    @comic = Fabricate :comic
  end

  step "I subscribe to that comic" do
    visit comics_path
    click_link "Subscribe"
  end

  step "I see that comic in my personal feed" do
    within "article.comic" do
      page.should have_content @comic.name
    end
  end
end
