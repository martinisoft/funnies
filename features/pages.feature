Feature: Static Pages
  In order to get more information about Funnies
  As a website visitor
  I want to view pages giving information about Funnies

  Scenario Outline: Content Pages
    When I go to the <page>
    Then I should <message>

    Scenarios:
      | page           | message              |
      | homepage       | see "Sign up"        |
      | about page     | see "The story"      |
      | copyright page | see "DMCA Takedowns" |
