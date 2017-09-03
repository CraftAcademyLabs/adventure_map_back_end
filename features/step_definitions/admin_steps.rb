Given(/^an admin user exist$/) do
  FactoryGirl.create(:admin_user)
end

Given(/^I (?:navigate to the root page|access the application)$/) do
  visit admin.root_path
end

Given(/^I fill in the login form with my credentials$/) do
  fill_in 'Email', with: 'admin@admin.com'
  fill_in 'Password', with: 'password'
end

Given(/^I access the application as an admin$/) do
  steps %q(
    Given an admin user exist
    And I access the application
    And I fill in the login form with my credentials
    And I click on "Sign in"
  )
end