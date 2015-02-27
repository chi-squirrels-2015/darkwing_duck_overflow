class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question
      t.references :user

      t.text :content
      t.integer :vote_count

      t.timestamps
    end
  end
end
