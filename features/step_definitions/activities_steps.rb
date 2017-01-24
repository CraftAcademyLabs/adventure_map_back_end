Given(/^there's an activity titled "([^"]*)" in the system$/) do |title|
  steps %Q(
    Given I click on "Create Activity"
    And I fill in "Title" with "#{title}"
    And I fill in "Body" with "#{title} is great fun!"
    And I fill in "Difficulty" with "3"
    And I fill in "Category" with "#{title.split[0]}"
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