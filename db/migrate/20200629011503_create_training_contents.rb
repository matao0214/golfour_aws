class CreateTrainingContents < ActiveRecord::Migration[5.2]
  def change
    create_table :training_contents do |t|
      t.integer :training_time, null: false
      t.integer :training_hits, null: false
      t.integer :training_post_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
