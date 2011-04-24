Feature: Admin deletes blog post
  As a site administrator
  I want to delete a blog post
  So I can untell the world about a cool feature of Funnies

  @javascript
  Scenario: Delete a blog post
    Given 1 post
    And I am signed in as an admin
    When I go to the blog page
    And I follow "Delete Post"
    And I accept the "Are you REALLY sure?" alert
    Then I should be on the posts page
    And I should not see "New Blog Post"
    And I should not see "Hello World"
    And I should see "Post deleted successfully"

  Scenario: User does not see delete post link
    Given 1 post
    And I am signed in as a user
    When I go to the blog page
    Then I should not see "Delete Post"
