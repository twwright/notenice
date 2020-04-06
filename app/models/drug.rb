class Drug < ActiveRecord::Base
	has_many :side_effects
	has_many :users, through :side_effects

end
