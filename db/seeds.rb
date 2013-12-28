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
user = User.new :name => ENV['ADMIN_NAME'], :email => ENV['ADMIN_EMAIL'], :password => ENV['ADMIN_PW'], :password_confirmation => ENV['ADMIN_PW']
puts 'user: ' << user.name
user.skip_confirmation!
user.save
user.add_role :admin

puts 'Creating story'
story = Story.create :story_name => '賣饅頭的爺爺', contact_email: 'marcuslin0724@gmail.com', appear_day: ['週一至週日'], appear_time_from: '12:00', appear_time_to: '23:00', info_from: 'test_info', city: '臺北市', appear_location:'景美站/公館站/萬隆站', story_details: '昨天在公館跟爺爺買饅頭挑饅頭的時候眼淚差點掉下來爺爺的饅頭有些都熱到發霉了但爺爺似乎沒發現自己辛苦做的饅頭因為悶熱而變質一直熱情的和我介紹饅頭的種類不忍心和爺爺說，怕爺爺會難過我把發霉的全都挑起來買走這樣爺爺明天就可以再作新鮮的饅頭賣給別人爺爺今年已經100歲了，為了生病的兒子出來賺錢多給了爺爺錢請他不要找了爺爺說他的每一塊錢都要靠自己賺爺爺每天下午會在捷運景美站傍晚到大約7點會在公館站1號出口7點後會在捷運萬隆站1號出口繼續賣希望有經過的朋友可以去跟爺爺買包饅頭讓爺爺的饅頭不用再因為賣不完放到隔天，天氣熱而變質我相信爺爺作的饅頭一定很好吃希望大家一起幫忙爺爺，或許我們能做的不多但是我們可以讓爺爺早點賣完早點回家休息'
puts 'changeing state'
story.published!
puts 'done!!'