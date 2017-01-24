Feature: Administrate users
  As a System Owner
  So that I can manage my application users
  I want to be able to view, edit, delete and create users through my admin dashboard


  Background:
    Given I access the application as an admin

  Scenario: Add a user
    Given I click on "Users"
    And I click on "Create User"
    And I fill in "Email" with "user@random.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I click on "Create User"
    Then I should see "User was successfully created"
    And there should be a user with email "user@random.com" in the system
