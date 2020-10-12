class User < ApplicationRecord
  has_many :reviews
  has_many :products, through: :reviews 
  
  validates :name, presence: true, uniqueness: true
  has_secure_password
end
