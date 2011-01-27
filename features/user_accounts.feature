Feature: User Accounts
  In order to enjoy my comics
  As a web comic enthusiast
  I need to be able to create and manage my account

  Scenario Outline: Creating a new account
    Given I am not authenticated
    When I go to register
    And I fill in "user_username" with "<username>"
    And I fill in "user_email" with "<email>"
    And I fill in "user_password" with "<password>"
    And I fill in "user_password_confirmation" with "<password>"
    And I press "Sign up"
    Then I should see "Signed in as <username>"

    Scenarios:
      | username  | email             | password  |
      | tester    | testing@test.com  | secrets   |
      | martini   | martini@soft.com  | m@rt1n1   |
