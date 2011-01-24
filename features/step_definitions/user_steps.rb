Given /^a(?:n)? (admin )?user with name "([^"]*)"$/ do |admin, user_name|
  Factory.create :user,
                 :name => user_name,
                 :is_admin => admin.present?
end
