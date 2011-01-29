Given /^the book "([^"]*)" by "([^"]*)" exists$/ do |name, authors|
  book_authors = []
  authors.split(",").each do |author|
    book_authors << Factory(:author, :full_name => author)
  end
  Factory(:book, :name => name, :authors => book_authors)
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

When /^I add the book "([^"]*)" by "([^"]*)"$/ do |book_name, author|
 When %Q{I fill in "book_name" with "#{book_name}"}
 When %Q{I fill in "book_authors_attributes_0_full_name" with "#{author}"}
 When %q{I press "book_submit"}
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
