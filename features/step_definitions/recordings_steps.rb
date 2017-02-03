And(/^I click on "([^"]*)" for recording "([^"]*)"$/) do |element, title|
  recording = ActivityDetail.find_by(file_attachment: title)
  row = find("tr[data-resource-id='#{recording.id}']")
  within row do
    click_link_or_button element
  end
end

Given(/^the following recordings exist$/) do |table|
  table.hashes.each do |hash|
    activity_name = hash.delete 'activity'
    activity = Activity.find_by(title: activity_name)
    hash.merge!(activity: activity)
    FactoryGirl.create(:activity_detail, hash)
  end
end

