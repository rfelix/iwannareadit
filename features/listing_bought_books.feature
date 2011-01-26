Feature: Listing all the Books that have been bought
  In order to be able to then take a book home
  As a user
  I want to be able to see which books have been bought

  Scenario:
    Given I am logged in as "John Doe"
    And the following books exist:
      | name      | authors      | votes |
      | Book 1    | author1      | 2     |
    And the following bought books exist:
      | name      | authors      | votes |
      | Book 2    | author2      | 3     |
      | Book 3    | author3      | 1     |
    When I go to the bought books page
    Then I should see "Book 2"
    And I should see "Book 3"
    And I should not see "Book 1"
