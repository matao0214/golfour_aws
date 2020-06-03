class CreateTrainingPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :training_posts do |t|
      t.string :training_place, limit: 50, null: false
      t.text :training_advance, limit: 150, null: false
      t.text :training_task, limit: 150, null: false
      t.text :training_impression, limit: 150
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
