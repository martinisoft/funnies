Feature: Static Pages
  In order to get more information about Funnies
  As an unregistered user
  I want to view pages giving information about Funnies

  Scenario: Landing Page
    When I go to the homepage
    Then I should see "Sign up"

  Scenario: About Page
    When I go to the about page
    Then I should see "This is the about page"
