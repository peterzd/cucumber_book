class Account
  def deposit(amount)
    @balance = amount
  end

  def balance
    @balance
  end
end

class CashSlot
  def contents
    @contents or raise "I'm empty!"
  end

  def dispense(amount)
    @contents = amount
  end
end

class Teller
  def initialize(cash_slot)
    @cash_slot = cash_slot
  end

  def withdraw_from(account, amount)
    @cash_slot.dispense amount
  end
end

module KnowsTheDomain
  def my_account
    @my_account ||= Account.new
  end

  def cash_slot
    @cash_slot ||= CashSlot.new
  end

  def teller
    @teller ||= Teller.new cash_slot
  end
end

World(KnowsTheDomain)


CAPTURE_CASH_NUMBER = Transform /^\$(\d+)$/ do |num|
  num.to_i
end

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
