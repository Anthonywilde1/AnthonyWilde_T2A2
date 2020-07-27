class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :meme, null: false, foreign_key: true
      t.integer :counter

      t.timestamps
    end
  end
end
