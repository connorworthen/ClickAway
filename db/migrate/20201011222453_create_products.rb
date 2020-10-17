class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :stock
      t.float :price
      t.text :description
      t.integer :manufacturer_id, null: false

      t.timestamps
    end
  end
end
