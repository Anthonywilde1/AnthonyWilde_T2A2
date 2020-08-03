class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :meme, null: false, foreign_key: true
      #i thought it would be stupid to create a comment class without a comment.....
      t.string :comment, null: false

      t.timestamps
    end
  end
end
