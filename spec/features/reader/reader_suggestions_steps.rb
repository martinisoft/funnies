steps_for :reader_suggestions do
  use_steps :reader

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
