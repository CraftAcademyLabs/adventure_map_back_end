Given(/^the user "([^"]*)" has an account$/) do |email|
  FactoryGirl.create(:user, email: email)
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