class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :golf_reki
      t.string :goal

      t.timestamps
      t.index :email, unique: true
    end
  end
end
