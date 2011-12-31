# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

User.delete_all
Role.delete_all
Image.delete_all

puts "Generating roles"
Role.create([{ :name => "admin" }])

User.create([{ :email => 'steph@endpoint.com', :password => 'foobar', :password_confirmation => 'foobar'}])

User.first.roles << Role.first
