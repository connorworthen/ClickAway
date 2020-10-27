class Product < ApplicationRecord
  belongs_to :manufacturer
  has_many :users, through: :reviews
  has_many :reviews


  scope :search, -> (name) { where("name LIKE ?", "%" + name + "%") }

end
