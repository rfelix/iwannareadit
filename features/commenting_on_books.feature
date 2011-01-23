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

  @wip
  Scenario: List comments starting from most recent at the top
