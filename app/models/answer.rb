class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :commenters,  through: :comments, source: :commenter

  has_many :votes, as: :voteable
  has_many :voters,  through: :votes, source: :voter

end
