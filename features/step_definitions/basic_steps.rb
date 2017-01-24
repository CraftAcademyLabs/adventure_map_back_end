Given(/^I click on "([^"]*)"$/) do |element|
  click_link_or_button element
end

And(/^I fill in "([^"]*)" with "([^"]*)"$/) do |element, content|
  fill_in element, with: content
end

And(/^I (?:am on|visit) the "([^"]*)" page$/) do |path|
  case path
    when 'user'
      visit users_path
  end
end