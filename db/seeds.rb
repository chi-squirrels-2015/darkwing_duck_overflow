# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#### NEEDS USER AND QUESTION ARGUMENTS)



100.times do
  User.create!(username: Faker::Internet.user_name,
               email: Faker::Internet.free_email,
               password: 'password')
end

users = User.all


20.times do
  Question.create!(title: Faker::Hacker.say_something_smart.gsub(/[!.]$/, '?'),
                   content: Faker::Hacker.say_something_smart.gsub(/[!.]$/, '?') + ' ' + Faker::Hacker.say_something_smart.gsub(/[!.]$/, '?') + ' ' + Faker::Hacker.say_something_smart.gsub(/[!.]$/, '?'),
                   user: users.sample,
                   created_at: rand(1.year).ago,
                   updated_at: rand(1.year).ago)
end

questions = Question.all


100.times do
  Answer.create!(content: Faker::Hacker.say_something_smart + ' ' + Faker::Hacker.say_something_smart + ' ' + Faker::Hacker.say_something_smart,
                 user: users.sample,
                 question: questions.sample)
end

answers = Answer.all


10.times do
  Vote.create!(voteable: questions.sample,
               voter: users.sample)
end

10.times do
  Vote.create!(voteable: answers.sample,
               voter: users.sample)
end

20.times do
  Comment.create!(content: Faker::Hacker.say_something_smart,
                  commentable: questions.sample,
                  commenter: users.sample)
end

10.times do
  Comment.create!(content: Faker::Hacker.say_something_smart,
                  commentable: answers.sample,
                  commenter: users.sample)
end
