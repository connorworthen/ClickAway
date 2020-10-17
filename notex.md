manufact
has many products
has one user

user
has many reviews
has mnay products through reviews
belongs to manufacturer if condtion

review
belongs to user
belongs to product

product
belongs to manufact
has many reviews
has mnay users through reviews

no edit for product
review join table

TO-DO-LIST:
need to make \_form html pages
user if admin can edit + delete profile + manufacturer profile in one page

Check-list:
user signup + sign in + logout + edit all work

class Manufacturer < ApplicationRecord
has_many :products
has_one :user
end

class Review < ApplicationRecord
belongs_to :product
belongs_to :user

validates :rating, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
validates :comment, presence: true
end

class User < ApplicationRecord
has_secure_password
has_many :reviews
has_many :products, through: :reviews
belongs_to :manufacturer

validates :name, :presence => true, :uniqueness => true, :length => { :in => 4..16 }
validates :password, :confirmation => true #password_confirmation attr
validates_length_of :password, :in => 6..16, if: :password_digest_changed?

after_update :check_admin?, unless: :admin_blank?

def admin_blank?
self.admin.blank?
end

def check_admin?
self.admin = true
end

end

class Product < ApplicationRecord
belongs_to :manufacturer
has_many :users, through: :reviews
has_many :reviews
end

create_table "manufacturers", force: :cascade do |t|
t.string "name"
t.integer "established"
t.string "bio"
t.datetime "created_at", precision: 6, null: false
t.datetime "updated_at", precision: 6, null: false
end

create_table "manufacturers_users", id: false, force: :cascade do |t|
t.integer "user_id", null: false
t.integer "manufacturer_id", null: false
t.index ["manufacturer_id"], name: "index_manufacturers_users_on_manufacturer_id"
t.index ["user_id"], name: "index_manufacturers_users_on_user_id"
end

create_table "products", force: :cascade do |t|
t.string "name"
t.float "stock"
t.float "price"
t.text "description"
t.integer "manufacturer_id", null: false
t.datetime "created_at", precision: 6, null: false
t.datetime "updated_at", precision: 6, null: false
end

create_table "users", force: :cascade do |t|
t.string "name"
t.string "password_digest"
t.boolean "admin", default: false
t.datetime "created_at", precision: 6, null: false
t.datetime "updated_at", precision: 6, null: false
end
