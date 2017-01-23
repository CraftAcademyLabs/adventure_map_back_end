Feature: Admin can add AdminUsers
  As a System Owner
  So that I can have other members of my team administer the application
  I want to be able to create new AdminUsers

  Background:
    Given I access the application as an admin

  Scenario: create new AdminUser with valid settings
    And I click on "Admin user"
    And I click on "Create Admin user"
    And I fill in "Email" with "another_admin@admin.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I click on "Create Admin user"
    Then there should be an admin user with email "another_admin@admin.com" in the system