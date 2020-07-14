class AddSomeColumnsToTrainingPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :training_posts, :task_ball_dont_hits_club, :string
    add_column :training_posts, :task_slice, :string
    add_column :training_posts, :task_hook, :string
    add_column :training_posts, :task_ball_dont_fly_far, :string
    add_column :training_posts, :task_flight_distance_dont_change, :string
    add_column :training_posts, :task_get_duffed, :string
    add_column :training_posts, :task_other, :string
  end
end
