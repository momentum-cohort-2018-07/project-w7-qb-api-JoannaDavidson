class CreateWhiners < ActiveRecord::Migration[5.2]
  def change
    create_table :whiners do |t|
      t.string :name, limit: 32
      t.string :username, limit: 32
      t.string :email
      t.string :password_digest
      t.string :auth_token

      t.timestamps
    end
    add_index :whiners, :username, unique: true
    add_index :whiners, :email, unique: true
    add_index :whiners, :auth_token, unique: true
  end
end
