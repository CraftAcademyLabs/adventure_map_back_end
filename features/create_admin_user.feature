Feature: Admin can add AdminUsers
  As a System Owner
  So that I can have other members of my team administer the application
  I want to be able to create new AdminUsers

  Background:
    Given I access the application as an admin

  Scenario: create new AdminUser with valid settings
    And I click on "Administrators"
    And I click on "Create Admin user"
    And I fill in "First name" with "Admin"
    And I fill in "Last name" with "McAnother"
    And I fill in "Email" with "another_admin@admin.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I click on "Create Admin user"
    Then there should be an admin user with email "another_admin@admin.com" in the system

  Scenario: attempts to create new AdminUser with invalid settings (existing user)
    And I click on "Administrators"
    And I click on "Create Admin user"
    And I fill in "First name" with "Admin"
    And I fill in "Last name" with "McAnother"
    And I fill in "Email" with "admin@admin.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I click on "Create Admin user"
    Then I should see "Email has already been taken"

  Scenario: attempts to create new AdminUser with invalid settings (no password)
    And I click on "Administrators"
    And I click on "Create Admin user"
    And I fill in "First name" with "Admin"
    And I fill in "Last name" with "McAnother"
    And I fill in "Email" with "new_admin@admin.com"
    And I fill in "Password" with ""
    And I fill in "Password confirmation" with ""
    And I click on "Create Admin user"
    Then I should see "Password is too short (minimum is 6 characters)"