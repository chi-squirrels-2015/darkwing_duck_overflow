class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments
  has_many :votes, as: :votable
  has_many :voters,  through: :votes, source: :voter
end
