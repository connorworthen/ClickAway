class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :stock
      t.float :price
      t.text :description
      t.references :user, null: false, foreign_key: true
    end
  end
end
