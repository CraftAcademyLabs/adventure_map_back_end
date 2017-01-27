Given(/^the user "([^"]*)" has an account$/) do |email|
  FactoryGirl.create(:user, email: email)
end

Given(/^the user "([^"]*)" has an interest "([^"]*)"$/) do |email, interest|
  user = User.find_by(email: email)
  user.interest_list.add(interest)
  user.save
end

And(/^I click on "([^"]*)" for user "([^"]*)"$/) do |element, email|
  user = User.find_by(email: email)
  row = find("tr[data-resource-id='#{user.id}']")
  within row do
    click_link_or_button element
  end
end

Given(/^the following users exist$/) do |table|
  table.hashes.each do |user|
    FactoryGirl.create(:user, user)
  end
end

And(/^I select date "([^"]*)" from Date of birth$/) do |date|
  page.execute_script(
          "$('#user_date_of_birth').val('#{date}').trigger('keyup-change');"
  )
end


And(/^I fill in the form with basic credentials$/) do
  steps %q{
    And I fill in "Email" with "user@random.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I select "Male" from "Gender"
    And I fill in "City" with "Gothenburg"
    And I select date "1971-11-24" from Date of birth
        }
end