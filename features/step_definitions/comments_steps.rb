When(/^I click on "([^"]*)" for comment "([^"]*)"$/) do |element, comment|
  comment = Comment.find_by(body: comment)
  row = find("tr[data-comment-id='#{comment.id}']")
  within row do
    click_link_or_button element
  end
end

Given(/^the following comments exist$/) do |table|
  table.hashes.each do |hash|
    activity_name = hash.delete 'activity'
    user = User.find_by_name( hash.delete('user') )
    activity = Activity.find_by(title: activity_name)
    hash.merge!(activity: activity)
    hash.merge!(user: user)
    FactoryGirl.create(:comment, hash)
  end
end
