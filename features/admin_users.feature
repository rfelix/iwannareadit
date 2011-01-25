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

  Scenario: Listing can only be seen by admin users
    Given I am logged in as "John Doe"
    When I go to the users page
    Then I should see "You're not an admin user."
    And I should be on the homepage

  Scenario: Promote normal user to admin
    Given I am logged in as admin "John Doe"
    And a user with name "Jane Doe"
    When I go to the users page
    And I follow "Promote to Admin" within "#users_listing"
    Then I should see "Promoted user."
    And I should see "Jane Doe" within "#admin_users_listing"

  Scenario: Demote admin user to normal
    Given I am logged in as admin "John Doe"
    And an admin user with name "Jane Doe"
    When I go to the users page
    And I follow "Demote to Normal" within "#admin_users_listing tr:nth-child(3)"
    Then I should see "Demoted user."
    And I should see "Jane Doe" within "#users_listing"

  Scenario: Admin can't demote themselves
    Given I am logged in as admin "John Doe"
    When I go to the users page
    Then I should not see "Demote to Normal" within "#admin_users_listing"
