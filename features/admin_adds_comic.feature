Feature: Admin adds a comic
  As a site administrator
  I want to add a new comic
  So other users can subscribe to the comics

  Scenario: Add a comic with an RSS feed
    Given I am logged in as the following user:
      | username | admin |
      | admin    | true  |
    When I go to the comics page
    And I follow "Add comic"
    And I fill in "Name" with "xkcd"
    And I fill in "Homepage" with "http://xkcd.com"
    And I fill in "Feed URL" with "http://xkcd.com/rss.xml"
    And I press "Save"
    Then I should see "xkcd"
    And I should see "Comic added successfully"

    When I follow "edit"
    Then the "Name" field should contain "xkcd"
    And the "Homepage" field should contain "http://xkcd.com"
    And the "Feed URL" field should contain "http://xkcd.com/rss.xml"
