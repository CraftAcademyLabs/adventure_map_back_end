Feature: User has interests
  As a User
  in order to filter my feed
  I need to tag myself with pre-defined list of interest.

  Background:
    Given I access the application as an admin

  @javascript
  Scenario: Add a user with an interest
    Given I click on "Users"
    And I click on "Create User"
    And I fill in the form with basic credentials
    And I set interest to "Hiking"
    And I click on "Create User"
    Then I should see "Hiking"

  @javascript
  Scenario: Edit User and add interest
    Given the user "user_1@ranom.com" has an account
    And I click on "Users"
    And I click on "Edit" for user "user_1@ranom.com"
    And I set interest to "Cross country skiing"
    And I click on "Update User"
    Then I should see "User was successfully updated"
    And I should see "Cross country skiing"

  @javascript
  Scenario: Cannot add a user with an invalid interest
    Given I click on "Users"
    And I click on "Create User"
    And I fill in the form with basic credentials
    And I set interest to "Being lazy"
    And I click on "Create User"
    Then I should see "Being lazy is not a valid selection"

  Scenario: Show a user
    Given the user "user_2@ranom.com" has an account
    Given the user "user_2@ranom.com" has an interest "Cross country skiing"
    And I click on "Users"
    And I click on "Show" for user "user_2@ranom.com"
    Then I should see "user_2@ranom.com"
    And I should see "Cross country skiing"

