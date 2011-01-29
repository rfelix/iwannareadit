Given /^the book "([^"]*)" by "([^"]*)" exists$/ do |name, authors|
  Factory(:book, :name => name, :authors => authors)
end

Given /^the following( bought)? books exist:$/ do |bought, table|
  table.hashes.each do |hash|
    book = Given %Q{the book "#{hash[:name]}" by "#{hash[:authors]}" exists}
    Given %Q{the book "#{hash[:name]}" is marked as bought} if bought.present?
    hash[:votes].to_i.times do |i|
      user = Factory.create(:user)
      vote = Vote.for(user, book)
      vote.up
      vote.save
    end
  end
end

Given /^the book "([^"]*)" is marked as bought$/ do |book_name|
  book = Book.find_by_name(book_name)
  book.is_bought = true
  book.save!
end

Then /^I should see the following books:$/ do |table|
  table.hashes.each do |hash|
    # The +1 offset is due to the table headers in HTML
    Then %Q{I should see "#{hash[:name]}" within "tr:nth-child(#{hash[:position].to_i + 1})"}
  end
end
