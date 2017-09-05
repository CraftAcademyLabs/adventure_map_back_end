Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Then(/^there should be an admin user with email "([^"]*)" in the system$/) do |email|
  new_admin_user = User.find_by(email: email)
  expect(new_admin_user.persisted?).to eq true
  expect(new_admin_user.administrator).to eq true
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

Then(/^there should be no activity detail with filename "([^"]*)"$/) do |file_name|
  activity_detail = ActivityDetail.find_by(file_attachment: file_name)
  expect(activity_detail).to be_nil
end

And(/^the activity should be associated with "([^"]*)"$/) do |name|
  expect(@activity.user.first_name).to eq name
end

Then(/^I should not see "([^"]*)"$/) do |content|
  expect(page).not_to have_content content
end

Then(/^there should be no comment "([^"]*)" in the system$/) do |comment|
  comment = Comment.find_by(body: comment)
  expect(comment).to be_nil
end
