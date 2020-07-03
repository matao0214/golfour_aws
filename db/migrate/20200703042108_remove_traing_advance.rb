class RemoveTraingAdvance < ActiveRecord::Migration[5.2]
  def up
    remove_column :training_posts, :training_advance
   end

  def down
    add_column :training_posts, :training_advance, :string
  end
end
