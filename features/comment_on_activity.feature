Feature: As a User
  in order to share my thoughts
  I would like to be able to comment on an Activity.
  Background:
    Given the following users exist
      | name | email            |
      | Sigu | sigu@example.com |

    And the following activities exist
      | title                | body            | difficulty | category | user             |
      | Skiing in Aspen      | it was awesome  | 3          | Climbing | sigu@example.com |
      | Second time in Aspen | time well spent | 1          | Climbing | sigu@example.com |

    And the following comments exist
      | body                 | user | activity        |
      | I loved this one :-) | Sigu | Skiing in Aspen |

    And I access the application as an admin
    And I click on "Activities"

  Scenario: I can comment on Activity
    Given I click on "Show" for activity "Skiing in Aspen"
    When I click on "New Comment"
    And I select "Skiing in Aspen" from "Activity"
    And I fill in "Comment" with "I loved this one :-)"
    And I click on "Create Comment"
    Then I should see "I loved this one :-)"

  Scenario: I can destroy a comment from activity show page
    When I click on "Show" for activity "Skiing in Aspen"
    Then I should see "I loved this one :-)"
    When I click on "Delete" for comment "I loved this one :-)"
    Then there should be no comment "I loved this one :-)" in the system

  Scenario: I can see the comments list
    When I click on "Comments"
    Then I should see "I loved this one :-)"
    And I should see "Sigu"
    And I should see "Skiing in Aspen"
