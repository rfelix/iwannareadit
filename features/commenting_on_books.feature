Feature: Commenting on Books
  In order to discuss the various book suggestions with fellow collegues
  As a user
  I want to be able to comment on book suggestions

  Scenario: Adding a comment to a book suggestion
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    When I go to the book page for "Ruby Best Practices"
    And fill in "comment_body" with "This is a great book!"
    And press "Add Comment"
    Then I should see "Comment added."
    And I should see "This is a great book!" within "#comments_list .body"
    And I should see "John Doe" within "#comments_list tr:nth-child(1) .user"

  Scenario: Two comments listed from most recent at the top
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    When I go to the book page for "Ruby Best Practices"
    And fill in "comment_body" with "Comment Number 1"
    And press "Add Comment"
    And fill in "comment_body" with "Comment Number 2"
    And press "Add Comment"
    Then I should see "Comment added."
    And show me the page
    And I should see "Comment Number 2" within "#comments_list tr:nth-child(1) .body"
    And I should see "Comment Number 1" within "#comments_list tr:nth-child(2) .body"

  @wip
  Scenario: Edit a comment
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    And the comment "Unedited" for "Ruby Best Practices"
    When I go to the book page for "Ruby Best Practices"
    And I follow "Edit"
    And I fill in "comment_body" with "This was edited man"
    And I press "Edit Comment"
    Then I should see "Comment successfully edited."
    And I should see "This was edited man"

  @wip
  Scenario: Delete a comment
    Given I am logged in as "John Doe"
    And the book "Ruby Best Practices" by "Gregory Brown" exists
    And the comment "Awesomeness" for "Ruby Best Practices"
    When I go to the book page for "Ruby Best Practices"
    And I follow "Delete"
    Then I should see "Comment has been deleted."
    And I should not see "Awesomeness"
