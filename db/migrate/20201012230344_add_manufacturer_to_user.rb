class AddManufacturerToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :manufacturer, :boolean, default: false
  end
end