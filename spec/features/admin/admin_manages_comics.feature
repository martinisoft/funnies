Feature: Admin manages comics
  As an admin
  I would like to manage comics
  So that I can keep all the comics up to date

  Scenario: Admin adds a comic
    Given I am signed in as an admin
    When I add a comic
    Then I see that new comic in the comics list
