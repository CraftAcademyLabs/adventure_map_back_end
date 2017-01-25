Feature: Create Activity
  As a System Owner
  in order to add content to the system
  I need to be able to create Activities using the admin interface


  Background:
    Given the following users exist
      | name   | email             |
      | Thomas | thomas@random.com |
      | Viktor | viktor@random.com |

    And I access the application as an admin
    And I click on "Activities"

  Scenario: Create a feature
    Given I click on "Create Activity"
    And I fill in "Title" with "Hiking in Grand Canyon"
    And I fill in "Body" with "Hiking in Grand Canyon is great fun!"
    And I select "1" from "Difficulty"
    And I fill in "Category" with "Hiking"
    And I select "Thomas" from "User"
    And I click on "Create Activity"
    Then I should see "Activity was successfully created"
    And there should be an activity titled "Hiking in Grand Canyon" in the system
    And the activity should be associated with "Thomas"

  Scenario: Show a user
    Given "Thomas" has an activity titled "Skiing in Aspen" in the system
    And I click on "Show" for activity "Skiing in Aspen"
    Then I should see "Skiing in Aspen"

  Scenario: Edit Activity
    Given "Thomas" has an activity titled "Skiing in Aspen" in the system
    And I click on "Edit" for activity "Skiing in Aspen"
    And I fill in "Title" with "Skiing in Snowmass"
    And I select "2" from "Difficulty"
    And I click on "Update Activity"
    Then I should see " Activity was successfully updated"
    And there should be an activity titled "Skiing in Snowmass" in the system

  Scenario: Delete an activity
    Given "Thomas" has an activity titled "Skiing in Aspen" in the system
    And I click on "Destroy" for activity "Skiing in Aspen"
    Then I should see "Activity was successfully destroyed"
    And there should be no activity titled "Skiing in Snowmass" in the system

  Scenario: Filter by Username
    Given "Viktor" has an activity titled "Skiing in Aspen" in the system
    Then I should see "Skiing in Aspen"
    And I filter on "Thomas" from "User"
    And I click on "Filter"
    Then I should not see "Skiing in Aspen"

  Scenario: Filter by title
    Given "Thomas" has an activity titled "Skiing in Aspen" in the system
    And "Viktor" has an activity titled "Hiking in Grand Canyon" in the system
    Then I should see "Skiing in Aspen"
    Then I should see "Hiking in Grand Canyon"
    And I filter on "Hiking" from "Title"
    And I click on "Filter"
    Then I should not see "Skiing in Aspen"
    Then I should see "Hiking in Grand Canyon"


