class Comment < ActiveRecord::Base
  validates :commentable_type, inclusion: { in: ["Question", "Answer"] }

  belongs_to :commenter, class_name: "User"
  belongs_to :commentable, polymorphic: true
end
