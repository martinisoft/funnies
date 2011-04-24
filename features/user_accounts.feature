Feature: User Accounts
  In order to enjoy my comics
  As a web comic enthusiast
  I need to be able to create and manage my account

  Scenario: Creating a new account
    Given I am on the homepage
    When I follow "Sign up"
    And I fill in "Username" with "Bishop"
    And I fill in "Email" with "bishop@weylandindustries.com"
    And I fill in "Password" with "secrets"
    And I fill in "Password confirmation" with "secrets"
    And I press "Sign up"
    Then I should see "You have signed up successfully"
    When "bishop@weylandindustries.com" opens the email
    And I follow "Confirm my account" in the email
    Then I should see "Your account was successfully confirmed."
    And I should not see "Sign up"
    And I should see "Bishop"

  Scenario Outline: Logging in
    Given the following user:
      | username | martinisoft      |
      | email    | martini@soft.com |
      | password | foobar           |
    And I am signed out
    When I go to login
    And I fill in "user_login" with "<login>"
    And I fill in "user_password" with "<password>"
    And I press "Sign In"
    Then I should <action>

    Scenarios:
      | login            | username    | password | action                                                |
      | martinisoft      | martinisoft | foobar   | see "Signed in successfully" within the notice flash  |
      | bad@login.com    | verybad     | barbaz   | see "Invalid login" within the alert flash            |

  Scenario: Logging out
    Given I am logged in
    When I go to logout
    Then I should see "Signed out successfully"
