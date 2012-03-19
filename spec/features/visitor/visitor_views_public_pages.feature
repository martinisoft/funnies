Feature: Visitor views public pages
  As a site visitor
  I would like to get more information before signing up
  So that I can learn more about the Funnies project

  Background:
    Given I am a site visitor

  Scenario: landing page
    When I visit the landing page
    Then I see a link to sign up

  Scenario: about page
    When I visit the about page
    Then I see the backstory to Funnies

  Scenario: copyright page
    When I visit the copyright page
    Then I see information about copyrights
