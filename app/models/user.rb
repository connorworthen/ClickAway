class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :products, through: :reviews 
  
  # attr_accessible :name, :password, :manufacturer, :approved_on
  after_update :check_admin?, unless: :admin_blank?

  # def password_blank?
  #   self.password.blank?
  # end

  # def name_blank?
  #   self.name.blank?
  # end

  def admin_blank?
    self.admin.blank?
  end

  def check_admin?
    self.admin = true
  end


  # validates :name, presence: true, uniqueness: true
  # validates :password, presence: true, length: { minimum: 4 }
  
  # validates :password, length: { minimum: 4 }, unless: "password.nil?"
  # validates :password, presence: true, if: "id.nil?"

  # after_update :set_manufacturer, if: :password_blank? && :name_blank?

  # def password_blank?
  #   self.password.blank?
  # end

  # def name_blank?
  #   self.name.blank?
  # end

  # def set_manufacturer
  #   self.manufacturer = true
  # end

end

# when leaving name blank for manufacturer access, set name + password to nil rendering the account useless on log out
# still leaves user id active in db however which could use to login?