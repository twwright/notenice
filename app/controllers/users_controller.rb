class UserController < ApplicationController

	get '/signup' do
		if logged_in?
			 redirect '/drugs'
		else 
			@failure_message = session[:failure_message]
			session[:failure_message] = nil
			erb :'/users/signup'
		end
	end

	post '/signup' do
		user = User.new(params)
		if user.save
				session[:user_id] = user.id
				redirect '/signup'
		else 
				session[:failure_message] = user.errors.messages
				binding.pry
				redirect '/signup'
		end
	end

end