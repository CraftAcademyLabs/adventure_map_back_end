Given(/^"([^"]*)" has an activity titled "([^"]*)" in the system$/) do |username, title|
  steps %Q(
    Given I click on "Create Activity"
    And I fill in "Title" with "#{title}"
    And I fill in "Body" with "#{title} is great fun!"
    And I select "3" from "Difficulty"
    And I select "Climbing" from "Category"
    And I select "#{username}" from "User"
    And I click on "Create Activity"
        )
end

And(/^I click on "([^"]*)" for activity "([^"]*)"$/) do |element, title|
  activity = Activity.find_by(title: title)
  row = find("tr[data-resource-id='#{activity.id}']")
  within row do
    click_link_or_button element
  end
end

Given(/^"([^"]*)" has a recording "([^"]*)"$/) do |title, recording_title|
  recording = FactoryGirl.create(:activity_detail, file_attachment: recording_title)
  activity = Activity.find_by(title: title)
  activity.activity_details << recording
end

Given(/^the following activities exist$/) do |table|
  table.hashes.each do |hash|
    user_email = hash.delete 'user'
    user_id = User.find_by(email: user_email).id
    hash.merge!(user_id: user_id )
    FactoryGirl.create(:activity, hash)
  end
end
