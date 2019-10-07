puts 'Started genarating hash_string for each user'

User.all.each do |user|
  user.hash_string = Digest::SHA1.hexdigest(user.email)
  user.save
end

puts 'Completed generating hash_string for all users'

User.all.each do |user|
  puts user.email
  puts user.hash_string
end
