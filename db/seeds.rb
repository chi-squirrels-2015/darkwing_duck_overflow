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
Question.create!(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user: users.sample)
end

questions = Question.all

20.times do
Answer.create!(content: Faker::Lorem.paragraph, user: users.sample, question: questions.sample)
end

answers = Answer.all

10.times do
  Vote.create!(voteable: questions.sample, voter: users.sample)
end

10.times do
  Vote.create!(voteable: answers.sample, voter: users.sample)
end

20.times do
  Comment.create!(content: Faker::Lorem.paragraph, commentable: questions.sample, commenter: users.sample)
end

10.times do
  Comment.create!(content: Faker::Lorem.paragraph, commentable: answers.sample, commenter: users.sample)
end
