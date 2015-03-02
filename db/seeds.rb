# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


100.times do
  User.create!(username: [(Faker::Internet.user_name + Faker::Number.number(5)), (Faker::Internet.user_name + Faker::Number.number(4)), (Faker::Hacker.noun + Faker::Number.number(4))].sample,
               email: [Faker::Internet.free_email, Faker::Internet.email, Faker::Internet.safe_email].sample,
               password: 'password')
end

users = User.all


30.times do
  Question.create!(title: Faker::Hacker.say_something_smart.gsub(/[!.]$/, '?'),
                   content: Faker::Hacker.say_something_smart.gsub(/[!.]$/, '?') + ' ' + Faker::Hacker.say_something_smart.gsub(/[!.]$/, '?') + ' ' + Faker::Hacker.say_something_smart.gsub(/[!.]$/, '?'),
                   user: users.sample,
                   created_at: Faker::Time.between(6.months.ago, Time.now, :all),
                   updated_at: Faker::Time.between(6.months.ago, Time.now, :all))
end

questions = Question.all


120.times do
  Answer.create!(content: Faker::Hacker.say_something_smart + ' ' + Faker::Hacker.say_something_smart + ' ' + Faker::Hacker.say_something_smart,
                 user: users.sample,
                 question: questions.sample)
end

answers = Answer.all


35.times do
  Vote.create!(voteable: questions.sample,
               voter: users.sample)
end

50.times do
  Vote.create!(voteable: answers.sample,
               voter: users.sample)
end

25.times do
  Comment.create!(content: Faker::Hacker.say_something_smart,
                  commentable: questions.sample,
                  commenter: users.sample)
end

15.times do
  Comment.create!(content: Faker::Hacker.say_something_smart,
                  commentable: answers.sample,
                  commenter: users.sample)
end
