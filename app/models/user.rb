class User < ApplicationRecord
  has_many :reviews
  has_many :products, through: :reviews 
  
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true 
  validates :username, presence: true, uniqueness: true
end
