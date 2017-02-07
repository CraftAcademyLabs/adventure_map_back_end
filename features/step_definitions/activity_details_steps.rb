When(/^I click on "([^"]*)" for activity detail "([^"]*)" in "([^"]*)"$/) do |element, title, location|
  activity_detail = ActivityDetail.find_by(file_attachment: title)
  if location == 'list'
    row = find("tr[data-recording-id='#{activity_detail.id}']")
  else
    row = find("tr[data-resource-id='#{activity_detail.id}']")
  end
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

