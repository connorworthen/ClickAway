class Product < ApplicationRecord
  belongs_to :manufacturer
  has_many :users
  belongs_to :user
  has_many :reviews
end
