namespace :users do
  def toggle_admin(name, toggle)
    u = User.find_by_name(name)
    u.is_admin = true
    u.save!
    u
  end

  desc "Mark user as admin"
  task :mark_as_admin, :name, :needs => :environment do |t, args|
    u = toggle_admin(args[:name], true)
    puts "#{u.name} is now an admin user."
  end

  desc "Unmark user as admin"
  task :unmark_as_admin, :name, :needs => :environment do |t, args|
    u = toggle_admin(args[:name], false)
    puts "#{u.name} is now a normal user."
  end

end
