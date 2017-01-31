Then(/^show me the page$/) do
  save_and_open_page
end

Then(/^show me an image of the page$/) do
  save_and_open_screenshot
end
