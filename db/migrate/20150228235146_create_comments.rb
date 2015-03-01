class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.references :commentable, polymorphic: true
      t.belongs_to :commenter, class_name: "User"

      t.timestamps
    end
  end
end
