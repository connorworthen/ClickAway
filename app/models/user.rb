class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :products, through: :reviews 
  
  # attr_accessible :name, :password, :manufacturer, :approved_on
  validates :name, presence: true
end