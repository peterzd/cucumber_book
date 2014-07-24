CAPTURE_CASH_NUMBER = Transform /^\$(\d+)$/ do |num|
  num.to_i
end
