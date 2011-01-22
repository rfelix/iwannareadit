Feature: Listing all the Books that have been suggested
  In order to vote for the books that most interest me
  As a user
  I want to be able to see all the books that were suggested
  And be able to easily vote them up or down

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

