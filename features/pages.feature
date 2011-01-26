Feature: Pages Feature
  In order to get more information about Funnies
  As an unregistered user
  I want to view pages giving information about Funnies

  Scenario: Landing Page Scenario
    When I go to the landing page
    Then I should see "Welcome to Funnies"
    And I should see "This is the landing page"

