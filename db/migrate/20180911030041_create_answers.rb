class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :body
      t.belongs_to :whiner, foreign_key: true
      t.belongs_to :whine, foreign_key: true

      t.timestamps
    end
  end
end
