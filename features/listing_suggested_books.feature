Feature: Listing all the Books that have been suggested
  In order to vote for the books that most interest me
  As a user
  I want to be able to see all the books that were suggested
  And be able to easily vote them up or down

  Background:
    Given I am logged in as "John Doe"

  Scenario: List 3 suggested books
    Given the following books exist:
      | name      | authors      | votes |
      | Book 1    | author1      | 2     |
      | Book 2    | author2      | 3     |
      | Book 3    | author3      | 1     |
    When I go to the books page
    Then I should see the following books:
      | position | name    |
      | 1        | Book 2  |
      | 2        | Book 1  |
      | 3        | Book 3  |

  Scenario: Voting books from listing
    Given the following books exist:
      | name      | authors      | votes |
      | Book 1    | author1      | 2     |
      | Book 2    | author2      | 3     |
    When I go to the books page
    # Vote up book 1 which is the last in list
    And I follow "Up" within "tr:nth-child(3)"
    # Vote down book 2 is the first in list
    And I follow "Down" within "tr:nth-child(2)"
    Then I should see the following books:
      | position | name    |
      | 1        | Book 1  |
      | 2        | Book 2  |
    And I should not see "Up" within "tr:nth-child(3) a"
    And I should not see "Down" within "tr:nth-child(2) a"


