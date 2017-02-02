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
