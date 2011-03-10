Feature: Admin deletes a comic
  As a site administrator
  I want to remove a comic
  So other users can no longer subscribe to that comic

  @javascript
  Scenario: Delete a comic
    Given I am signed in as an admin
    And a comic already exists
    When I go to the comics page
    And I follow "Delete Comic"
    And I will confirm my choice
    Then I should not see "xkcd"
    And I should see "Comic deleted successfully"

  Scenario: User does not see delete comic link
    Given I am signed in as a user
    When I go to the comics page
    Then I should not see "Delete Comic"
