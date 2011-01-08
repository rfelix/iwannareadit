namespace :deploy do

  task :production do
    `git push heroku release:master`
    puts "Pushed release branch to Heroku"
    `heroku rake db:migrate`
    puts "Ran migrations on Heroku"
    puts "Deployed!"
  end

end
