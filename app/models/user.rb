class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments, foreign_key: :commenter_id
  has_many :commented_questions, through: :comments, source: :question
  has_many :commented_answers, through: :comments, source: :answer

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :answers
  has_many :questions
  has_many :answered_questions, through: :answers, source: :question
  has_many :cast_votes, class_name: "Vote", foreign_key: :voter_id
end
