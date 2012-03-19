Feature: Reader suggestions
  As a reader
  I would like to make a suggestion
  So that the admins can get new ideas

  Scenario: suggest a comic
    Given I am signed in as a reader
    When I suggest a comic
    Then I see the request was sent successfully
