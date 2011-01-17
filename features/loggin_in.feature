Feature: Loggin in/out
  In order to keep things private
  As a user
  I don't want people who aren't logged in to access the app

  Scenario: Unauthorized user access
    When I go to the homepage
    Then I should be on the login page
    And I should see "Please login."

  Scenario: Authorized user logging in
    Given I am logged in as "John Doe"
    When I go to the login page
    Then I should be on the books page


  # This has to be tested by hand because of the
  # hack used to simulate an authorized user
  #
  # Scenario: Authorized user loggin out
    #  Given I am logged in as "John Doe"
    #  When I go to the homepage
    #  And I remove the login hack
    #  And I follow "Logout"
    #  Then I should be on the login page
    #  And I should see "Logged out."
