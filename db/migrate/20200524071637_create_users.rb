class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname, limit: 10, null: false
      t.string :email, unique: true, null: false
      t.string :password_digest, null: false
      t.string :golf_reki
      t.string :goal, limit: 50

      t.timestamps
    end
  end
end
