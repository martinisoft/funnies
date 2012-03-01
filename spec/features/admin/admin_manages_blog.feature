Feature: Admin manages blog
  As an admin
  I want to manage the blog
  So that I can keep users up to date with news

  Background:
    Given I am signed in as an admin

  Scenario: add blog post
    When I add a blog post
    Then I see that post

  Scenario: edit blog post
    Given a blog post
    When I edit that post
    Then I see the updated post

  Scenario: delete blog post
    Given a blog post
    When I delete that post
    Then I don't see that post
