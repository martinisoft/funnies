Feature: User is redirected after login
  As a user
  I want to see my comics after I sign in to my account
  So that I can enjoy my comics quickly

  Scenario: Redirect after login
    Given 1 user
    And I am signed out
    When I sign in as "martinisoft"
    Then I am redirected to "/martinisoft/comics"
