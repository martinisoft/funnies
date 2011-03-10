Feature: Admin adds blog post
  As a site administrator
  I want to make a blog post
  So I can tell the world about something cool with the Funnies app

  Scenario: Add a blog post
    Given I am signed in as an admin
    When I go to the blog page
    And I follow "New Post"
    And I fill in "Title" with "New Blog Post"
    And I fill in "Body" with "Hello World"
    And I press "Save"
    Then I should be on the posts page
    And I should see "New Blog Post"
    And I should see "Hello World"
    And I should see "Post created successfully"

  Scenario: User does not see new post link
    Given I am signed in as a user
    When I go to the blog page
    Then I should not see "New Post"
