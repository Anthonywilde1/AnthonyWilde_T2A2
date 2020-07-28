class CreateMemes < ActiveRecord::Migration[6.0]
  def change
    create_table :memes do |t|
      #just flavor text
      t.text :name, null: false
      t.text :description
      #string as its a AWS link in the end
      t.string :image, null: false
      #float because dollars and cents
      t.float :price, null: false
      t.integer :category
      #if set to false then a buy option will not appear on page for users, may also hide price
      t.boolean :for_sale, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
