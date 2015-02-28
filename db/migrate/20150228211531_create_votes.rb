class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :count

      t.belongs_to :votable, polymorphic: true
      t.belongs_to :voter, class_name: "User"

      t.timestamps
    end
  end
end
