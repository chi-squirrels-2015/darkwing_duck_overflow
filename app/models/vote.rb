class Vote < ActiveRecord::Base
  validates :voter, presence: true, uniqueness: { scope: [:voteable_id, :voteable_type] }
  validates :voteable, presence: true
  validates :voteable_type, inclusion: { in: ["Question", "Answer"] }


  belongs_to :voter, class_name: "User"
  belongs_to :voteable, polymorphic: true

  def up_vote
     self.increment!
  end

  def down_vote
    self.decrement!
  end
end
