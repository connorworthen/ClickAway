class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :products, through: :reviews 
  # belongs_to :manufacturer, => { where(admin: true)}, :foreign_key => :manufacturer_id

  validates :name, :presence => true, :uniqueness => true, :length => { :in => 4..16 }
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..16, if: :password_digest_changed?
  
  after_update :check_admin?, unless: :admin_blank?

  def admin_blank?
    self.admin.blank?
  end

  def check_admin?
    self.admin = true
  end

end
