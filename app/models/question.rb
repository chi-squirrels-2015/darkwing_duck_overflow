class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments


  def up_vote
     @question.increment! :vote_count
  end

  def down_vote
    @question.decrement! :vote_count
  end
end
