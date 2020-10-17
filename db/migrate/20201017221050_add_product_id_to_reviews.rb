class AddProductIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :product_id, :integer, null: false
  end
end
