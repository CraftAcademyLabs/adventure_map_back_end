Feature: Activity has activity details
  As a User
  in order to show where my Activity took place
  I need to be able to add one or many Recording(s) to an Activity

  Background:
    Given the following users exist
      | first_name | email            |
      | Sigu       | sigu@example.com |

    And the following activities exist
      | title                | body            | difficulty | category | user             |
      | Skiing in Aspen      | it was awesome  | 3          | Climbing | sigu@example.com |
      | Second time in Aspen | time well spent | 1          | Climbing | sigu@example.com |

    And the following recordings exist
      | file_attachment                   | activity             | attachment_type |
      | http://good_url.se/recording1.mp4 | Skiing in Aspen      | Image           |
      | http://good_url.se/recording2.mp4 | Skiing in Aspen      | Image           |
      | http://good_url.se/recording3.mp4 | Second time in Aspen | Image           |

    And I access the application as an admin
    And I click on "Activities"

  Scenario: Create an activity detail
    Given I click on "Activity Details"
    And I click on "Create Activity detail"
    And I select "Skiing in Aspen" from "Activity"
    And I select "Image" from "Attachment type"
    And I fill in "File attachment" with "http://good_url.se/some-file.jpg"
    And I click on "Create Activity detail"
    Then I should see "http://good_url.se/some-file.jpg"
    And I should see "Skiing in Aspen"


  Scenario: Show activity details on activity show page
    When I click on "Show" for activity "Skiing in Aspen"
    Then I should see "Sigu"
    And I should see "recording1.mp4"

  Scenario: Delete activity details
    When I click on "Activity Details"
    When I click on "Destroy" for activity detail "http://good_url.se/recording1.mp4" in "table"
    Then there should be no activity detail with filename "recording1.mp4"
    And there should be an activity titled "Skiing in Aspen" in the system

  Scenario: Delete activity detail from activity show page
    When I click on "Show" for activity "Skiing in Aspen"
    Then I should see "recording1.mp4"
    When I click on "Delete" for activity detail "http://good_url.se/recording1.mp4" in "list"
    Then there should be no activity detail with filename "recording1.mp4"

  Scenario: Filter by filename
    When I click on "Activity Details"
    Then I should see "http://good_url.se/recording3.mp4"
    Then I filter on "http://good_url.se/recording1.mp4" from "File_attachment"
    And I click on "Filter"
    Then I should not see "http://good_url.se/recording3.mp4"
