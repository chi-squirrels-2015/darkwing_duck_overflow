class Vote < ActiveRecord::Base
  validates :voter, presence: true, uniqueness: { scope: [:votable_id, :votable_type] }
  validates :votable, presence: true
  validates :votable_type, inclusion: { in: ["Question", "Answer"] }
  validates_inclusion_of :count, :in => (-1..1)


  belongs_to :voter, class_name: "User"
  belongs_to :votable, polymorphic: true

  def up_vote
     self.increment!
  end

  def down_vote
    self.decrement!
  end
end
