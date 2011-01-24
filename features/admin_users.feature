Feature: Admin Users
  In order to manage the application and books
  As an admin user
  I want to be able to do things that normal users shouldn't be able to

  Scenario: Listing admin and normal users
    Given I am logged in as admin "John Doe"
    And a user with name "Jane Doe"
    When I go to the users page
    Then I should see "John Doe" within "#admin_users_listing"
    And I should see "Jane Doe" within "#users_listing"
