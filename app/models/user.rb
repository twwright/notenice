class User < ActiveRecord::Base
  has_many :notes
  has_secure_password validations: false
  
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :password, presence: true, length: { minimum: 6 }, if: :password_digest_changed?
  # validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
