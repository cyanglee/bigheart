# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'ROLES'
%w(admin user guest).each do |role|
  Role.find_or_create_by_name(role)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.new :name => Settings.admin_name.dup, :email => Settings.admin_email.dup, :password => Settings.admin_password.dup, :password_confirmation => Settings.admin_password.dup
puts 'user: ' << user.name
user.skip_confirmation!
user.save
user.add_role :admin