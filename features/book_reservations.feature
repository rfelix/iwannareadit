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
