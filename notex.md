manufact
has many products

user
has many reviews
has mnay products through reviews

review
belongs to user
belongs to product

product
belongs to manufact
has many reviews
has mnay users through reviews

no edit for product
review join table

t.references :user, null: false, foreign_key: true
class AddManufacturerToUser < ActiveRecord::Migration[6.0]
def change
add_column :users, :manufacturer, :boolean, default: false
end
end
