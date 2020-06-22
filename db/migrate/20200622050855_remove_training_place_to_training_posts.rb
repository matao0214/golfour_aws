class RemoveTrainingPlaceToTrainingPosts < ActiveRecord::Migration[5.2]
  def up
    remove_column :training_posts, :training_place
  end

  def down
    add_column :training_posts, :training_place, :string
  end
end
