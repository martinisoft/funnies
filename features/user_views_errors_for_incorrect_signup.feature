Feature: User views errors for incorrect signup information
  As an unregistered user
  I would like to see friendly error messages when the signup form is not filled out correctly
  So I can identify the information that needs to be corrected

  Scenario: Incorrect Signup Information
    Given I am on the homepage
    When I follow "Sign up"
    And I press "Sign up"
    Then I should see an error on the username field
    And I should see an error on the email field
    And I should see an error on the password field
