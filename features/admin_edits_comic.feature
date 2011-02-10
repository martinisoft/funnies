Feature: Admin edits a comic
  As a site administrator
  I want to be able to edit information about a comic
  So that I can keep up with comics that change

  Scenario: Edit a comic
    Given I am signed in as an admin
    And a comic already exists
    When I go to the comics page
    And I follow "Edit Comic"
    And I fill in "Name" with "VG Cats"
    And I fill in "Homepage" with "http://www.vgcats.com"
    And I fill in "Title XPath" with a title xpath
    And I fill in "Image XPath" with an image xpath
    And I press "Save"
    Then I should see "VG Cats"
    And I should see "Comic updated successfully"
