Feature: User sees home page instead of comics page
  As a site administrator
  I want to make sure visitors without accounts cannot see the comics page
  So that they can create an account

  Scenario: Redirect to homepage
    Given I am signed out
    When I go to the comics page
    Then I am redirected to "/"
