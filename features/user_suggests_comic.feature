Feature: User suggests a comic to be added
  As a registered user
  I want to suggest a comic to be listed in the App
  So that I can enjoy more of the comics I want to see

  Scenario: Suggest a comic
    Given I am signed in as a user
    And I am on the comics page
    When I follow "Suggest a comic"
    And I fill in "Name" with "Dominic Deegan"
    And I fill in "Website" with "http://www.dominic-deegan.com/"
    And I fill in "Reason to add this comic" with "It rocks!"
    And I press "Submit"
    Then I should see "Thank you for suggesting a comic!"
