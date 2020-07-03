class RemoveTraingAdvanceFromTrainingPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :training_posts, :training_advance, :string
  end
end
