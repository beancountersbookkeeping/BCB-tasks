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
    task = Task.create!(
      title: Faker::Lorem.sentence
    )
  end
  tasks = Task.all

  5.times do
    company = Company.create!(
      name: Faker::Lorem.word
    )
  end
  companys = Company.all

puts "Seed finished"
puts "#{User.count} users created."
puts "#{Task.count} tasks created."
puts "#{Company.count} companys created."
