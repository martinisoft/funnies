require 'spec_helper'

feature "Admin manages blog" do
  scenario "Adding a blog post" do
    @admin_info = { email: "admin@example.com", password: "foobar" }
    @admin = Fabricate :admin, @admin_info
    visit new_user_session_path
    fill_in "Username or Email", with: @admin_info[:email]
    fill_in "Password", with: @admin_info[:password]
    click_button "Sign In"
    @post_info = {
      title: "An interesting post",
      body: "Have you heard the one about the chef and the fish?"
    }
    visit posts_path
    click_link "New Post"
    fill_in "Title", with: @post_info[:title]
    fill_in "Body", with: @post_info[:body]
    click_button "Save"
    visit posts_path
    within "section.posts article" do
      expect(page).to have_content(@post_info[:title])
      expect(page).to have_content(@post_info[:body])
    end
  end

  scenario "Editing a blog post" do
    @admin_info = { email: "admin@example.com", password: "foobar" }
    @admin = Fabricate :admin, @admin_info
    visit new_user_session_path
    fill_in "Username or Email", with: @admin_info[:email]
    fill_in "Password", with: @admin_info[:password]
    click_button "Sign In"
    @post_info = {
      title: "An interesting post",
      body: "Have you heard the one about the chef and the fish?"
    }
    @post = Fabricate :post, @post_info
    @new_post_info = {
      title: "Even more interesting information",
      body: "Did you hear the other one about the tortise and the hare?"
    }
    visit posts_path
    click_link "Edit Post"
    fill_in "Title", with: @new_post_info[:title]
    fill_in "Body", with: @new_post_info[:body]
    click_button "Save"
    visit posts_path
    within "section.posts article" do
      expect(page).to have_content(@new_post_info[:title])
      expect(page).to have_content(@new_post_info[:body])
    end
  end

  scenario "Deleting a blog post" do
    @admin_info = { email: "admin@example.com", password: "foobar" }
    @admin = Fabricate :admin, @admin_info
    visit new_user_session_path
    fill_in "Username or Email", with: @admin_info[:email]
    fill_in "Password", with: @admin_info[:password]
    click_button "Sign In"
    @post_info = {
      title: "An interesting post",
      body: "Have you heard the one about the chef and the fish?"
    }
    @post = Fabricate :post, @post_info
    visit posts_path
    click_link "Delete Post"
    visit posts_path
    within "section.posts" do
      expect(page).to_not have_content(@post_info[:title])
      expect(page).to_not have_content(@post_info[:body])
    end
  end
end
