class AddLimitToSpots < ActiveRecord::Migration[5.2]
  def change
    change_column :spots, :address, :string, limit: 50, null: false
  end
end
