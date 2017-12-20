class CreateItemcomments < ActiveRecord::Migration[5.1]
  def change
    create_table :itemcomments do |t|
      t.string :text
      t.integer :item_id
      t.integer :user_id

      t.timestamps
    end
  end
end
