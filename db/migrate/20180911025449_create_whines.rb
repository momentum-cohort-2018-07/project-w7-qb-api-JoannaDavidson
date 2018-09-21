class CreateWhines < ActiveRecord::Migration[5.2]
  def change
    create_table :whines do |t|
      t.string :title, limit: 80
      t.text :body
      t.belongs_to :whiner, foreign_key: true

      t.timestamps
    end
  end
end
