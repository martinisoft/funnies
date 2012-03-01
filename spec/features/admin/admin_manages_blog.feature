Feature: Admin manages blog
  As an admin
  I want to manage the blog
  So that I can keep users up to date with news

  Scenario: add blog post
    Given I am signed in as an admin
    When I add a blog post
    Then I see that post
