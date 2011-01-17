Given /^a user with name "([^"]*)"$/ do |user_name|
  Factory.create(:user)
end

Given /^I am logged in as "([^"]*)"$/ do |user_name|
  $user = Given "a user with name \"#{user_name}\""

  # It's a hack, but this way we don't have to try and simulate logging in with omniauth
  class ApplicationController
    def current_user
      @current_user ||= $user
      $user
    end
  end
end
