Feature: Activity has recordings
  As a User
  in order to show where my Activity took place
  I need to be able to add one or many Recording(s) to an Activity

  Background:
    Given the following users exist
      | name   | email             |
      | Sigu   | sigu@example.com  |

    And I access the application as an admin
    And I click on "Activities"

  Scenario: Show recordings on activity show page
    Given "Sigu" has an activity titled "Skiing in Aspen" in the system
    And "Skiing in Aspen" has a recording "Wow_skii.mp4"
    And I click on "Show" for activity "Skiing in Aspen"
    Then I should see "Sigu"
    And I should see "Wow_skii.mp4"

  Scenario: Delete recordings
    Given "Sigu" has an activity titled "Skiing in Aspen" in the system
    And "Skiing in Aspen" has a recording "Wow_skii.mp4"
    And I click on "Recordings"
    When I click on "Destroy" for recording "Wow_skii.mp4"
    Then there should be no recording with filename "Wow_skii.mp4"
