# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  User.destroy_all
  user1 = User.create!(user_name: "George")
  user2 = User.create!(user_name: "Paul")
  user3 = User.create!(user_name: "John")
  user4 = User.create!(user_name: "Ringo")
  user5 = User.create!(user_name: "Vel'koz")
  user6 = User.create!(user_name: "Hecarim")

  
  Poll.destroy_all
  poll1 = Poll.create!(title: "Favorites", author_id: user1.id)
  poll2 = Poll.create!(title: "Monsters", author_id: user5.id)

  Question.destroy_all
  question1 = Question.create!(body: "Favorite Beatle?", poll_id: poll1.id)
  question2 = Question.create!(body: "Favorite Song?", poll_id: poll1.id)

  question3 = Question.create!(body: "Best noodle monster?", poll_id: poll2.id)
  question4 = Question.create!(body: "Most stupidly OP Monster? ", poll_id: poll2.id)


  AnswerChoice.destroy_all
  ac1 = AnswerChoice.create!(question_id: question1.id, choice: "George")
  ac2 = AnswerChoice.create!(question_id: question1.id, choice: "Ringo")
  ac3 = AnswerChoice.create!(question_id: question2.id, choice: "Dear Prudence")
  ac4 = AnswerChoice.create!(question_id: question2.id, choice: "Rocky Racoon")
  ac5 = AnswerChoice.create!(question_id: question3.id, choice: "Vel'koz")
  ac6 = AnswerChoice.create!(question_id: question3.id, choice: "Also Vel'koz")
  ac7 = AnswerChoice.create!(question_id: question4.id, choice: "Hecarim")
  ac8 = AnswerChoice.create!(question_id: question4.id, choice: "Still Hecarim")

  Response.destroy_all

  r1 = Response.create!(user_id: user3.id, answer_choice_id: ac2.id)
  r2 = Response.create!(user_id: user4.id, answer_choice_id: ac1.id)
  r3 = Response.create!(user_id: user5.id, answer_choice_id: ac3.id)
  r4 = Response.create!(user_id: user2.id, answer_choice_id: ac4.id)
  r5 = Response.create!(user_id: user1.id, answer_choice_id: ac5.id)
  r6 = Response.create!(user_id: user6.id, answer_choice_id: ac5.id)
end