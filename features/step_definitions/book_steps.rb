Given /^the book "([^"]*)" by "([^"]*)" exists$/ do |name, authors|
  Factory(:book, :name => name, :authors => authors)
end

