Feature: Administrate users
  As a System Owner
  So that I can manage my application users
  I want to be able to view, edit, delete and create users through my admin dashboard

  Background:
    Given I access the application as an admin

  @javascript
  Scenario: Add a user
    Given I click on "Users"
    And I click on "Create User"
    And I fill in "Email" with "user@random.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I select "Male" from "Gender"
    And I fill in "City" with "Gothenburg"
    And I select date "1971-11-24" from Date of birth
    And I click on "Create User"
    Then I should see "User was successfully created"
    And there should be a user with email "user@random.com" in the system

  Scenario: Edit User (with password update)
    Given the user "user_1@ranom.com" has an account
    And I click on "Users"
    And I click on "Edit" for user "user_1@ranom.com"
    And I fill in "Email" with "new_email_user_1@ranom.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I click on "Update User"
    Then I should see "User was successfully updated"
    And there should be a user with email "new_email_user_1@ranom.com" in the system

  Scenario: Edit User (withuout password update)
    Given the user "user_1@ranom.com" has an account
    And I click on "Users"
    And I click on "Edit" for user "user_1@ranom.com"
    And I fill in "Email" with "new_email_user_1@ranom.com"
    And I click on "Update User"
    Then I should see "User was successfully updated"
    And there should be a user with email "new_email_user_1@ranom.com" in the system

#  Disabled until we can solve the Froxen Hash issue on Destroy
#  Scenario: Delete a user
#    Given the user "user_2@ranom.com" has an account
#    And I click on "Users"
#    Then show me the page
#    And I click on "Destroy" for user "user_2@ranom.com"
#    Then I should see "User was successfully deleted"
#    And there should no be a user with email "user_2@ranom.com" in the system

  Scenario: Show a user
    Given the user "user_2@ranom.com" has an account
    And I click on "Users"
    And I click on "Show" for user "user_2@ranom.com"
    Then I should see "user_2@ranom.com"