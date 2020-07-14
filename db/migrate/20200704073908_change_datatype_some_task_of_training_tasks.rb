class ChangeDatatypeSomeTaskOfTrainingTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :training_tasks, :training_task_1, :string
    change_column :training_tasks, :training_task_2, :string
    change_column :training_tasks, :training_task_3, :string
    change_column :training_tasks, :training_task_4, :string
    change_column :training_tasks, :training_task_5, :string
    change_column :training_tasks, :training_task_6, :string
    change_column :training_tasks, :training_task_a, :string
  end
end
