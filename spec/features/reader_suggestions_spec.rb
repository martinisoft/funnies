require 'spec_helper'

feature "Reader suggestions" do
  scenario "Suggesting a comic" do
    sign_in_user
    visit comics_path
    click_link "Suggest a comic"
    fill_in "Name", with: "Dominic Deegan"
    fill_in "Website", with: "http://www.dominic-deegan.com/"
    fill_in "Reason to add this comic", with: "It rocks!"
    click_button "Submit"
    expect(page).to have_content("Thank you for suggesting a comic!")
  end
end
