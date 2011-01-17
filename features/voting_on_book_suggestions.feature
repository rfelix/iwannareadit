Feature: Voting on Book Suggestions
  In order to get the books that most interest me
  As a user
  I want to vote book suggestions up or down

  Scenario: Vote up a suggestion
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    When I go to the book page for "Ruby Best Practices"
    And follow "Vote Up"
    Then I should see "Up Vote has been recorded."
    And I should see "1" within "#votes"

  Scenario: Vote up a suggestion twice
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    When I go to the book page for "Ruby Best Practices"
    And follow "Vote Up"
    And follow "Vote Up"
    Then I should see "You've already up voted this Book"
    And I should see "1" within "#votes"

  Scenario: Vote down a suggestion
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    When I go to the book page for "Ruby Best Practices"
    And follow "Vote Down"
    Then I should see "Down Vote has been recorded."
    And I should see "-1" within "#votes"

  Scenario: Vote down a suggestion twice
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    When I go to the book page for "Ruby Best Practices"
    And follow "Vote Down"
    And follow "Vote Down"
    Then I should see "You've already down voted this Book"
    And I should see "-1" within "#votes"

  Scenario: Vote a suggestion up, then down
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    When I go to the book page for "Ruby Best Practices"
    And follow "Vote Up"
    And follow "Vote Down"
    Then I should see "Down Vote has been recorded."
    And I should see "0" within "#votes"

  Scenario: Vote a suggestion down, then up
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    When I go to the book page for "Ruby Best Practices"
    And follow "Vote Down"
    And follow "Vote Up"
    Then I should see "Up Vote has been recorded."
    And I should see "0" within "#votes"

