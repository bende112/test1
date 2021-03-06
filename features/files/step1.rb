Given(/^I visit "([^"]*)"$/) do |path|
  visit baseUrl() + path
  sleep 2
end

And(/^the "([^"]*)" page is displayed$/) do |titleName|
  expect(find('#dlg-dealersearch-title').text).to match titleName.to_s
  sleep 1
end

When(/^i enter a registration number "([^"]*)"$/) do |regNumber|
  OV12UYY = regNumber
  within('#page-container')do
  find('#vehicleReg').set(regNumber)
  sleep 2
  end
end

When(/^i click on the "([^"]*)" button$/) do |buttonName|
  within('#page-container')do
    buttonName ==find('.track-search').click
    sleep 2
  end
end

Then(/^the result for the registration number "([^"]*)" is displayed$/) do |regNumber|
   expect(find('.result').text).to match regNumber.to_s
   sleep 1
end

And(/^the cover start date "([^"]*)" with cover end date "([^"]*)" is displayed$/) do |startDate, endDate|
  resultDate1 = startDate
  resultDate2 = endDate
  assert_all_match(resultDate1, resultDate2)
end


Then(/^the the car does not exist with a message "([^"]*)" is displayed$/) do |error_Message|
  expect(find('.result').text).to match error_Message.to_s
end

Then(/^the a message "([^"]*)" is displayed$/) do |errorMessage|
  expect(find('.error-required').text).to match errorMessage.to_s
end