Feature: Activity has recordings
  As a User
  in order to show where my Activity took place
  I need to be able to add one or many Recording(s) to an Activity

  Background:
    Given the following users exist
      | name  | email             |
      | Sigu  | sigu@example.com  |

    And the following activities exist
      | title                | body            | difficulty | category | user             |
      | Skiing in Aspen      | it was awesome  | 3          | category | sigu@example.com |
      | Second time in Aspen | time well spent | 1          | category | sigu@example.com |

    And the following recordings exist
      | file_attachment | activity             |
      | recording1.mp4  | Skiing in Aspen      |
      | recording2.mp4  | Skiing in Aspen      |
      | recording3.mp4  | Second time in Aspen |

    And I access the application as an admin
    And I click on "Activities"

  Scenario: Show recordings on activity show page
    When I click on "Show" for activity "Skiing in Aspen"
    Then I should see "Sigu"
    And I should see "recording1.mp4"

  # Scenario: Delete recordings
  #   When I click on "Recordings"
  #   When I click on "Destroy" for recording "recording1.mp4"
  #   Then there should be no recording with filename "recording1.mp4"

  Scenario: Filter by filename
    When I click on "Recordings"
    Then I should see "recording3.mp4"
    Then I filter on "recording1.mp4" from "File_attachment"
    And I click on "Filter"
    Then I should not see "recording3.mp4"
