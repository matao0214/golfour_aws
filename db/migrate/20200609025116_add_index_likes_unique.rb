class AddIndexLikesUnique < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, %i[training_post_id user_id], unique: true
  end
end
