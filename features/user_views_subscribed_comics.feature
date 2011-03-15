Feature: User views their comics
  As a registered user
  I want to view my comics on one page
  So that I can easily enjoy my web comics

  Scenario: No subscribed comics
    Given 1 comic
    And I am signed in
    When I follow "My Comics"
    Then I should see "You are not subscribed to any comics"

  Scenario: View subscribed comics
    Given I am signed in
    And I am subscribed to a comic
    When I follow "My Comics"
    Then I should see "xkcd"
