class Manufacturer < ApplicationRecord
  has_many :products
  has_one :user
end
