class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :products, through: :reviews 
  
  # attr_accessible :name, :password, :manufacturer, :approved_on
  
  # validate :name_and_password

  # private
  # # def name_or_surname
  # #   if name.present? || surname.present?
  # #     errors.add(:name, "must be present") unless name.present?
  # #     errors.add(:surname, "must be present") unless surname.present?
  # #   end
  # # end


  # def name_and_password
  #   if name.present? || password.present?
  #     errors.add(:name, "must be present") unless name.present?
  #     errors.add(:password, "must be present") unless password.present?
  #   else name.blank? || password.blank?
  #     self.manufacturer = true
  #   end
  # end


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