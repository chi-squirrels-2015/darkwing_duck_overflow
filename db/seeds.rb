# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#### NEEDS USER AND QUESTION ARGUMENTS)

20.times do
  User.create!(username: Faker::Name.name, email: Faker::Internet.email, password: 'password')
end

users = User.all

20.times do
Question.create!(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, vote_count: 10, user: users.sample)
end

questions = Question.all

20.times do
Answer.create!(content: Faker::Lorem.paragraph, vote_count: 20, user: users.sample, question: questions.sample)
end


