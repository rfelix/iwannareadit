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

  Scenario: Listing all reservations for a book
    Given I am logged in as "John Doe"
    And a user with name "Jane Doe"
    And a user with name "Frank Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    And the book "Ruby Best Practices" is marked as bought
    And the book "Ruby Best Practices" is reserved by "John Doe"
    And the book "Ruby Best Practices" is reserved by "Jane Doe"
    And the book "Ruby Best Practices" is reserved by "Frank Doe"
    When I go to the book page for "Ruby Best Practices"
    Then I should see "John Doe" within "#reservations_list"
    Then I should see "Jane Doe" within "#reservations_list"
    Then I should see "Frank Doe" within "#reservations_list"
