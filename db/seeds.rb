include Faker

#Create Users

  5.times do
    user = User.create!(
    email:    Faker::Internet.email,
    password: Faker::Internet.password
    )
  end
  users = User.all

# Create tasks
  15.times do
    task.create!(
      title: Faker::Lorem.sentence,
      private: false
    )
  end
  tasks = task.all

puts "Seed finished"
puts "#{User.count} users created."
puts "#{task.count} tasks created."
