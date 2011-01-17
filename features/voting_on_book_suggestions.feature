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


