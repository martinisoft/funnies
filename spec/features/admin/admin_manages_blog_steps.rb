steps_for :admin_manages_blog do
  use_steps :admin

  step "I add a blog post" do
    @post = Fabricate :post
  end

  step "I see that post" do
    visit posts_path
    within "section.posts article" do
      page.should have_content @post.title
      page.should have_content @post.body
    end
  end
end
