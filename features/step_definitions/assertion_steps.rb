Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Then(/^there should be an admin user with email "([^"]*)" in the system$/) do |email|
  new_admin_user = AdminUser.find_by(email: email)
  expect(new_admin_user.persisted?).to eq true
end

And(/^there should be a user with email "([^"]*)" in the system$/) do |email|
  new_user = User.find_by(email: email)
  expect(new_user.persisted?).to eq true
end

And(/^there should no be a user with email "([^"]*)" in the system$/) do |email|
  user = User.find_by(email: email)
  expect(user).to eq nil
end

And(/^there should be a activity with titled "([^"]*)" in the system$/) do |title|
  activity = Activity.find_by(title: title)
  expect(activity.persisted?).to eq true
end