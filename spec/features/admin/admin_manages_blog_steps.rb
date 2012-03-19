steps_for :admin_manages_blog do
  use_steps :admin

  step "I add a blog post" do
    @post_info = {
      title: "An interesting post",
      body: "Have you heard the one about the chef and the fish?"
    }
    visit posts_path
    click_link "New Post"
    fill_in "Title", with: @post_info[:title]
    fill_in "Body", with: @post_info[:body]
    click_button "Save"
  end

  step "a blog post" do
    @post_info = {
      title: "An interesting post",
      body: "Have you heard the one about the chef and the fish?"
    }
    @post = Fabricate :post, @post_info
  end

  step "I see that post" do
    visit posts_path
    within "section.posts article" do
      page.should have_content @post_info[:title]
      page.should have_content @post_info[:body]
    end
  end

  step "I edit that post" do
    @new_post_info = {
      title: "Even more interesting information",
      body: "Did you hear the other one about the tortise and the hare?"
    }
    visit posts_path
    click_link "Edit Post"
    fill_in "Title", with: @new_post_info[:title]
    fill_in "Body", with: @new_post_info[:body]
    click_button "Save"
  end

  step "I see the updated post" do
    visit posts_path
    within "section.posts article" do
      page.should have_content @new_post_info[:title]
      page.should have_content @new_post_info[:body]
    end
  end

  step "I delete that post" do
    visit posts_path
    click_link "Delete Post"
  end

  step "I don't see that post" do
    visit posts_path
    within "section.posts" do
      page.should_not have_content @post_info[:title]
      page.should_not have_content @post_info[:body]
    end
  end
end
