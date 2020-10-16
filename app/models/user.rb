class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :products, through: :reviews 

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  
  after_update :check_admin?, unless: :admin_blank?

  def admin_blank?
    self.admin.blank?
  end

  def check_admin?
    self.admin = true
  end

end
