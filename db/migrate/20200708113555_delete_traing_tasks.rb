class DeleteTraingTasks < ActiveRecord::Migration[5.2]
  def change
    drop_table :training_tasks
  end
end
