Feature: Voting on Book Suggestions
  In order to get the books that most interest me
  As a user
  I want to vote book suggestions up or down

  Scenario: Vote up a suggestion
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    When I go to the book page for "Ruby Best Practices"
    And follow "Up"
    Then I should see "Up Vote has been recorded."
    And I should see "1" within ".voting"
    And I should not see "Up" within ".voting a"

  Scenario: Vote down a suggestion
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    When I go to the book page for "Ruby Best Practices"
    And follow "Down"
    Then I should see "Down Vote has been recorded."
    And I should see "-1" within ".voting"
    And I should not see "Down" within ".voting a"

  Scenario: Vote a suggestion up, then down
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    When I go to the book page for "Ruby Best Practices"
    And follow "Up"
    And follow "Down"
    Then I should see "Down Vote has been recorded."
    And I should see "0" within ".voting"

  Scenario: Vote a suggestion down, then up
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    When I go to the book page for "Ruby Best Practices"
    And follow "Down"
    And follow "Up"
    Then I should see "Up Vote has been recorded."
    And I should see "0" within ".voting"

