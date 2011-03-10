Feature: Admin edits blog post
  As a site Administrator
  I want to edit a blog post
  So I can correct any mistakes or post updates

  Scenario: Edit post
    Given I am signed in as an admin
    And a blog post exists
    When I go to the posts page
    And I follow "Edit Post"
    And I fill in "Title" with "I changed my mind"
    And I press "Save"
    Then I should be on the posts page
    And I should see "I changed my mind"
    And I should see "Post updated successfully"

  Scenario: User does not see edit post link
    Given I am signed in as a user
    And a blog post exists
    When I go to the blog page
    Then I should not see "Edit Post"
