Given /^the book "([^"]*)" by "([^"]*)" exists$/ do |name, authors|
  Factory(:book, :name => name, :authors => authors)
end

Given /^the following books exist:$/ do |table|
  table.hashes.each do |hash|
    book = Given %q{the book "#{hash[:name]}" by "#{hash[:author]}" exists}
    hash[:votes].to_i.times do |i|
      user = Factory.create(:user)
      Vote.for(user, book)
    end
  end
end

Then /^I should see the following books:$/ do |table|
  table.hashes.each do |hash|
    Then %q{I should see "#{hash[:name]}" within "td.row#position_#{hash[:position]}"}
  end
end
