Feature: User views blog page
  As a visitor or registered user
  I would like to see the blog page
  So that I can keep up with the latest news about Funnies

  Scenario: success
    Given I am on the homepage
    When I follow "Blog"
    Then I should be on the posts page
