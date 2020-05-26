class CreateTrainingPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :training_posts do |t|

      t.timestamps
    end
  end
end
