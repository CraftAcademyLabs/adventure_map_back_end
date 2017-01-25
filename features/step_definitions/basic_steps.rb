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

And(/^I select "([^"]*)" from "([^"]*)"$/) do |value, element|
  select value, from: element
end

And(/^I filter on "([^"]*)" from "([^"]*)"$/) do |value, element|
  within '#filters' do
    case element
      when 'User'
        select value, from: "filter[#{element.downcase}]"
      when 'Title'
        fill_in "filter[#{element.downcase}]", with: value
    end
  end
end