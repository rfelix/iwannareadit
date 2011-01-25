Given /^I am logged in as( admin)? "([^"]*)"$/ do |admin, user_name|
  if admin.blank?
    $logged_user = Given "a user with name \"#{user_name}\""
  else
    $logged_user = Given "an admin user with name \"#{user_name}\""
  end

  # It's a hack, but this way we don't have to try and simulate logging in with omniauth
  class ApplicationController
    def current_user
      @current_user = $logged_user
    end
  end
end

Given /^I am not logged in$/ do
  $logged_user = nil
end
