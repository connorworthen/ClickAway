class CreateManufacturers < ActiveRecord::Migration[6.0]
  def change
    create_table :manufacturers do |t|
      t.string :comapny_name
      t.string :bio
      t.integer :established
      
      t.timestamps
    end
  end
end
