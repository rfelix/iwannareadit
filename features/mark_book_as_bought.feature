Feature: Mark a book as bought
  In order to allow users to see which books the organization has bought
  As an admin user
  I want to be able to mark/unmark a book as bought

  Scenario: Marking a book as bought
    Given I am logged in as admin "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    When I go to the book page for "Ruby Best Practices"
    And follow "Mark as Bought"
    Then I should see "Book has been marked as bought."
    And I should not see "Mark as Bought"
    And I should see "Bought"

  Scenario: Unmarking a book as bought
    Given I am logged in as admin "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    And the book "Ruby Best Practices" is marked as bought
    When I go to the book page for "Ruby Best Practices"
    And follow "Unmark as Bought"
    Then I should see "Book has been unmarked as bought."
    And I should not see "Unmark as Bought"
    And I should not see "Bought"

  Scenario: Only admins can mark a book as bought
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    When I go to the book page for "Ruby Best Practices"
    Then I should not see "Mark as Bought"

  Scenario: Only admins can unmark a book as bought
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    And the book "Ruby Best Practices" is marked as bought
    When I go to the book page for "Ruby Best Practices"
    Then I should not see "Unmark as Bought"
