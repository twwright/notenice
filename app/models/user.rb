class User < ActiveRecord::Base
	has_many :notes
	has_secure_password
	validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
	#validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
	validates :password, length: { in: 6..20 }
end
