Feature: Suggesting Books
  In order to share a good book with others
  As a user
  I want to easily suggest books that I think should be bought

  Scenario: Suggesting a book
    Given I am on the homepage
    When I follow "Suggest a Book"
    And I fill in "book_name" with "Ruby Best Practices"
    And I fill in "book_authors" with "Gregory Brown"
    And I press "Suggest Book"
    Then I should see "Book has been suggested."
