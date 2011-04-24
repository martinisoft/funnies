Feature: User views updated comics
  As a registered user
  I want to see updated comics that I subscribe to
  So that I can keep up to date with the latest comics

  Scenario: View latest comics
    Given I am signed in as a user
    And I am subscribed to a comic
    And I run the "comics:update" rake task
    When I go to my user comics page
    Then I should see "xkcd"
    And I should see a new comic strip
