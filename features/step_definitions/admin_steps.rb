Given(/^an admin user exist$/) do
  AdminUser.create!(email:'admin@admin.com', password:'password')
end

Given(/^I am on the root page$/) do
  visit root_path
end

Given(/^I fill in the login form with my credentials$/) do
  fill_in 'Email', with: 'admin@admin.com'
  fill_in 'Password', with: 'password'
end

