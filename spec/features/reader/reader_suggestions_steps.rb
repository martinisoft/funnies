steps_for :reader_suggestions do
  use_steps :user_account

  step "I am signed in as a reader" do
    step "I am logged in as a confirmed user"
  end

  step "I suggest a comic" do
    visit comics_path
    click_link "Suggest a comic"
    fill_in "Name", with: "Dominic Deegan"
    fill_in "Website", with: "http://www.dominic-deegan.com/"
    fill_in "Reason to add this comic", with: "It rocks!"
    click_button "Submit"
  end

  step "I see the request was sent successfully" do
    page.should have_content "Thank you for suggesting a comic!"
  end
end
