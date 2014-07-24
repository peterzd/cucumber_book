Given(/^I have deposited (#{CAPTURE_CASH_NUMBER}) in my account$/) do |amount|
  my_account.deposit amount
  expect(my_account.balance).to eq(amount),
    "Expected the balance to be #{amount} but it was #{my_account.balance}"
end

When(/^I withdraw (#{CAPTURE_CASH_NUMBER})$/) do |amount|
  teller.withdraw_from my_account, amount
end

Then(/^(#{CAPTURE_CASH_NUMBER}) should be dispensed$/) do |amount|
  expect(cash_slot.contents).to eq amount
end
