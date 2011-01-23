Given /^a user with name "([^"]*)"$/ do |user_name|
  Factory.create(:user)
end
