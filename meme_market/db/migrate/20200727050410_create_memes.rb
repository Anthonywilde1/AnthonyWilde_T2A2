class CreateMemes < ActiveRecord::Migration[6.0]
  def change
    create_table :memes do |t|
      t.text :name
      t.text :description
      t.string :image
      t.float :price
      t.text :category
      t.boolean :for_sale
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
