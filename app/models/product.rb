class Product < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :user
  has_many :reviews
end
