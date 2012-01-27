Feature: User Account
  As a user
  I would like to manage my account
  So that I can save and share my reading preferences

  Scenario: Creating account
    Given I am on the registration page
    When I signup with valid information
    Then I should receive a confirmation email
    When I confirm my account
    Then I should be signed in

  Scenario: Logging in
    Given a confirmed user
    And I am on the sign in page
    When I fill in my credentials
    Then I should be signed in

  Scenario: Logging out
    Given I am logged in as a confirmed user
    When I sign out
    Then I should be signed out
