class AddApprovedOnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :approved_on, :datetime
  end
end
