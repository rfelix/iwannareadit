Feature: Suggesting Books
  In order to share a good book with others
  As a user
  I want to easily suggest books that I think should be bought

  Background:
    Given I am logged in as "John Doe"
    And I am on the homepage
    When I follow "Suggest a Book"

  Scenario: Suggesting a book
    When I add the book "Ruby Best Practices" by "Gregory Brown"
    Then I should see "Book has been suggested."
    And I should be on the book page for "Ruby Best Practices"
    And I should see "Ruby Best Practices - Books - I Wanna Read It!"

  Scenario: Suggestion a book without a name or author
    When I press "Suggest Book"
    Then I should see "No Book has been suggested."
    And I should see "Name can't be blank"
    And I should see "Authors first name can't be blank"
