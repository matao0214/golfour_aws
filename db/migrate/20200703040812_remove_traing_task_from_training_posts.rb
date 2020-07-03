class RemoveTraingTaskFromTrainingPosts < ActiveRecord::Migration[5.2]
  def up
    remove_column :training_posts, :training_task
   end

  def down
    add_column :training_posts, :training_task, :string
  end
end
