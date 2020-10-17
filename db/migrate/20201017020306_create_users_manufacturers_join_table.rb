class CreateUsersManufacturersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :manufacturers do |t|
      t.index :user_id
      t.index :manufacturer_id
    end
  end
end
