Feature: Checkin books in and out
  In order to let other know when I've taken out a book and when it's back
  As a user
  I want to be able to check out and check in books

  Scenario: Checking out 1 book
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    And the book "Ruby Best Practices" is marked as bought
    And the book "Ruby Best Practices" is reserved by "John Doe"
    When I go to the reservations page
    And I follow "Check out"
    Then I should see "You have now checked out the book"
    And I should not see "Check out"

  @wip
  Scenario: Checking in 1 book
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    And the book "Ruby Best Practices" is marked as bought
    And the book "Ruby Best Practices" is reserved by "John Doe"
    When I go to the reservations page
    And I follow "Check out"
    And I follow "Check in"
    Then I should see "You have now checked in the book"
    And I should not see "Ruby Best Practices"

