# db/seeds.rb

# Create some users
users = User.create!([
  { email: 'user1@example.com', password: 'password' },
  { email: 'user2@example.com', password: 'password' },
  { email: 'user3@example.com', password: 'password' }
])

# Create some events for each user
users.each do |user|
  Event.create!([
    { date: Date.today, creator: user },
    { date: Date.tomorrow, creator: user }
  ])
end

puts "Seed data created successfully!"
