Given /^the book "([^"]*)" by "([^"]*)" exists$/ do |name, authors|
  Factory(:book, :name => name, :authors => authors)
end

Given /^the following books exist:$/ do |table|
  table.hashes.each do |hash|
    book = Given %Q{the book "#{hash[:name]}" by "#{hash[:authors]}" exists}
    hash[:votes].to_i.times do |i|
      user = Factory.create(:user)
      vote = Vote.for(user, book)
      vote.up
      vote.save
    end
  end
end

Then /^I should see the following books:$/ do |table|
  table.hashes.each do |hash|
    Then %Q{I should see "#{hash[:name]}" within "tr#item#{hash[:position]}"}
  end
end
