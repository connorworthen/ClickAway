class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :products, through: :reviews 
  
  # attr_accessible :name, :password, :manufacturer, :approved_on
  validates :password, presence: true, confirmation: true, length: { in: 6..20 }, on: :update
  # validates :password, presence: true, confirmation: true, length: { in: 6..20 }, on: :update, if: :password_digest_changed?
  # validates :password_confirmation, presence: true, on: :create
  # validates :password_confirmation, presence: true, on: :update, if: :password_digest_changed?

  # validates :name, presence: true, confirmation: true, on: :create
  # # validates :name, presence: true, confirmation: true, on: :update, if: :name_changed?
  # validates :name, presence: true, on: :create
  validates :name, presence: true, on: :update

  after_update :set_manufacturer, if: :password_blank? && :name_blank?

  def password_blank?
    self.password.blank?
  end

  def name_blank?
    self.name.blank?
  end

  def set_manufacturer
    self.manufacturer = true
  end

end

# when leaving name blank for manufacturer access, set name + password to nil rendering the account useless on log out
# still leaves user id active in db however which could use to login?