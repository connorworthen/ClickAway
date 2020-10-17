class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.float :rating
      t.string :comment
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
