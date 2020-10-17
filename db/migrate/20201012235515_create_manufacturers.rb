class CreateManufacturers < ActiveRecord::Migration[6.0]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.integer :established
      t.string :bio
      
      t.timestamps
    end
  end
end
