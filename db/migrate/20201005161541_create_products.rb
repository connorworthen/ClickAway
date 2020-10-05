class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :stock
      t.float :price
      t.integer :manufacturer_id
      t.string :description
      t.timestamps
    end
  end
end
