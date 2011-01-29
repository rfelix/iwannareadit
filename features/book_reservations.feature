Feature: Book reservations
  In order to read a book that's been bought
  As a user
  I want to be able to show my interest in taking a book home by reserving a book

  Scenario: Reserving a book
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    And the book "Ruby Best Practices" is marked as bought
    When I go to the bought books page
    And I follow "Reserve"
    Then I should see "The book has successfully been reserved"

  Scenario: Listing a users book reservations
    Given I am logged in as "John Doe"
    And the following bought books exist:
      | name      | authors      | votes |
      | Book 1    | author1      | 3     |
      | Book 2    | author2      | 3     |
      | Book 3    | author3      | 1     |
    And the book "Book 2" is reserved by "John Doe"
    And the book "Book 3" is reserved by "John Doe"
    When I go to the reservations page
    Then I should see "Book 2"
    Then I should see "Book 3"
