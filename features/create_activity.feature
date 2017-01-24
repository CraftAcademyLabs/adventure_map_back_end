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

    Scenario: Create a feature
      Given I click on "Activities"
      And I click on "Create Activity"
      And I fill in "Title" with "Hiking in Crand Canyon"
      And I fill in "Body" with "Hiking in Crand Canyon is great fun!"
      And I fill in "Difficulty" with "3"
      And I fill in "Category" with "Hiking"
      And I click on "Create Activity"
      Then I should see "Activity was successfully created"
      And there should be a activity with titled "Hiking in Crand Canyon" in the system