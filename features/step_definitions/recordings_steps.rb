And(/^I click on "([^"]*)" for recording "([^"]*)"$/) do |element, title|
  recording = ActivityDetail.find_by(file_attachment: title)
  row = find("tr[data-resource-id='#{recording.id}']")
  within row do
    click_link_or_button element
  end
end

