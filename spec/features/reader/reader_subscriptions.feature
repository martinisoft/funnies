Feature: Reader subscriptions
  As a reader
  I would like to subscribe to comics
  So that I can read comics I am interested in seeing

  Scenario: Reader subscribes
    Given I am signed in as a reader
    And there is a comic to subscribe to
    When I subscribe to that comic
    Then I see that comic in my personal feed

  Scenario: Reader unsubscribes
    Given I am signed in as a reader
    And there is a comic to subscribe to
    And I subscribe to that comic
    When I unsubscribe from that comic
    Then I don't see that comic in my personal feed
    And I can subscribe to that comic again
