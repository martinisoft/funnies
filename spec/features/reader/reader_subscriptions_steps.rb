steps_for :reader_subscriptions do
  use_steps :reader

  step "there is a subscribable comic" do
    @comic = Fabricate :comic
  end

  step "I :subscribe to/from that comic" do |action|
    visit comics_path
    click_link action.titleize
  end

  step "I see that comic in my personal feed" do
    visit user_comics_path(@user)
    within "article.comic" do
      page.should have_content @comic.name
    end
  end

  step "I don't see that comic in my personal feed" do
    visit user_comics_path(@user)
    page.should_not have_css "article.comic"
  end

  step "I can subscribe to that comic again" do
    visit comics_path
    within "article.comic" do
      page.should have_content @comic.name
    end
    within ".comic_nav" do
      page.should have_link "Subscribe"
    end
  end

  placeholder :subscribe do
    match /(subscribe|unsubscribe)/ do |action|
      action
    end
  end
end
