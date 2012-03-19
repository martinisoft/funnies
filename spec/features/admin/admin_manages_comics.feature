Feature: Admin manages comics
  As an admin
  I would like to manage comics
  So that I can keep all the comics up to date

  Background:
    Given I am signed in as an admin

  Scenario: adds a comic
    When I add a comic
    Then I see that new comic in the comics list

  Scenario: edits a comic
    Given there is a comic
    When I edit that comic
    Then I see the updated comic information

  Scenario: deletes a comic
    Given there is a comic
    When I delete that comic
    Then I don't see that comic in the comics list
