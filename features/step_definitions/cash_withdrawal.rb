When(/^I withdraw (#{CAPTURE_CASH_NUMBER})$/) do |amount|
  teller.withdraw_from my_account, amount
end

Then(/^(#{CAPTURE_CASH_NUMBER}) should be dispensed$/) do |amount|
  expect(cash_slot.contents).to eq amount
end

