Given(/^my account has been credited (#{CAPTURE_CASH_NUMBER})$/) do |amount|
  my_account.credit amount
end

Then(/^the balance of my account should be (#{CAPTURE_CASH_NUMBER})$/) do |amount|
  expect(my_account.balance).to eq(amount), "Expected the balance to be #{amount} but it was #{my_account.balance}"
end
