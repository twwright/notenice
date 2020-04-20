class Note < ActiveRecord::Base
	belongs_to :user

	def self.public
		where(public: true)
	end

	def self.private
		where(public: false)
	end
end
