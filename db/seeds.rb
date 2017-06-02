seeds_root_path = "#{Rails.root}/db"

passwords = {
  password: 'password',
  password_confirmation: 'password'
}

activities = YAML.load_file("#{seeds_root_path}/activities.yml")
admin_users = YAML.load_file("#{seeds_root_path}/admin_users.yml")
activity_details = YAML.load_file("#{seeds_root_path}/activity_details.yml")
comments = YAML.load_file("#{seeds_root_path}/comments.yml")
follows = YAML.load_file("#{seeds_root_path}/follows.yml")
users = YAML.load_file("#{seeds_root_path}/users.yml")

default_location = {lat: 57.708870, lng: 11.974560}
activities.each do |activity|
  activity.merge!(default_location)
end

puts '== Seeding Database   ==================================================='
# Users
admin_users.each { |au| AdminUser.create(au.merge(passwords)) }
puts "#{AdminUser.count} Admin users created."

abort 'Only seeding Admin users' if Rails.env.production?

puts '-- Generating other resources for demo server   -------------------------'
users.each { |u| User.create(u.merge(passwords)) }
puts "#{User.count} Users created."

Activity.create(activities)
puts "#{Activity.count} Activities created."

ActivityDetail.create(activity_details)
puts "#{ActivityDetail.count} Activity Details created."

Comment.create(comments)
puts "#{Comment.count} Comments created"

Follow.create(follows)
puts "#{Follow.count} Follows created."

puts '== Database Seed complete  =============================================='
