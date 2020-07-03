class CreateTrainingTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :training_tasks do |t|
      t.integer :training_post_id, foreign_key: true, null: false
      t.integer :training_task_1
      t.integer :training_task_2
      t.integer :training_task_3
      t.integer :training_task_4
      t.integer :training_task_5
      t.integer :training_task_6
      t.integer :training_task_a

      t.timestamps
    end
  end
end
