class User < ActiveRecord::Base
	has_many :side_effects
	has_many :drugs, through: :side_effects
	has_secure_password
	validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
	validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
	validates :password, length: { in: 6..20 }
	validates :terms_of_service, acceptance: true
end


	# def uses_drug?(drug)
		# returns true when the drug has been used by the user
	# end

	# def has_side_effect?(side_effect)
		# returns true when the user has the side effect
	# end