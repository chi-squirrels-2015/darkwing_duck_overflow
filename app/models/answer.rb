class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  def up_vote
     @answer.increment! :vote_count
  end

  def down_vote
    @answer.decrement! :vote_count
  end
end
