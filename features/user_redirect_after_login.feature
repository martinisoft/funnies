Feature: User is redirected after login
  As a user
  I want to see my comics after I sign in to my account
  So that I can enjoy my comics quickly

  Scenario: Redirect after login
    Given I am signed out
    And a confirmed user exists
    When I sign in as "martini@soft.com"
    Then I am redirected to "/martinisoft/comics"
