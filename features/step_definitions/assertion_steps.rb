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

And(/^there should be an activity titled "([^"]*)" in the system$/) do |title|
  @activity = Activity.find_by(title: title)
  expect(@activity.persisted?).to eq true
end

And(/^there should be no activity titled "([^"]*)" in the system$/) do |arg|
  activity = Activity.find_by(title: title)
  expect(activity).to eq nil
end

Then(/^there should be no recording with filename "([^"]*)"$/) do |file_name|
  recording = ActivityDetail.find_by(file_attachment: file_name)
  expect(recording).to be_nil
end

And(/^the activity should be associated with "([^"]*)"$/) do |name|
  expect(@activity.user.name).to eq name
end

Then(/^I should not see "([^"]*)"$/) do |content|
  expect(page).not_to have_content content
end
