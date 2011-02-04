Feature: user unsubscribes a comic
  As a registered user
  I would like to unsubscribe from a comic
  So that I can keep reading the comics I like

  Scenario: Unsubscribe from a comic
    Given I am signed in
    And I am subscribed to a comic
    When I go to the comics page
    And I follow "Unsubscribe"
    Then I should see "Unsubscribed from xkcd"
    And I should see "xkcd"
    And I should see "Subscribe"
