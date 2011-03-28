Feature: Static Pages
  In order to get more information about Funnies
  As a website visitor
  I want to view pages giving information about Funnies

  Scenario Outline: Content Pages
    When I go to the <page>
    Then I should <message>

    Scenarios:
      | page           | message                          |
      | homepage       | see "Sign up"                    |
      | about page     | see "This is the about page"     |
      | copyright page | see "This is the copyright page" |
      | copyright page | see "DMCA Takedowns" |
