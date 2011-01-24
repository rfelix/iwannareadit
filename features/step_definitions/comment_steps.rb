Given /^the comment "([^"]*)" for "([^"]*)"$/ do |body, book_name|
  Factory(:comment,
          :body => body,
          :book => Book.find_by_name(book_name))
end
