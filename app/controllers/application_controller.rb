require './config/environment'

class ApplicationController < Sinatra::Base

	configure do
	 set :public_folder, 'public'
	 set :views, 'app/views'
	 enable :sessions
	 set :session_secret, "saltyhashes"
	end

	get "/" do
		@failure_message = session[:failure_message]
		session[:failure_message] = nil
		@logged_in = !!session[:user_id]
		erb :index
	end

	helpers do
		def current_user
			@user = User.find_by_id(session[:user_id])
		end
			
		def logged_in?
			!!session[:user_id]
		end

		def logged_out_error
			session[:current_errors] = []
			session[:current_errors] << "Sorry, you must be logged in to view that page."
		end

		def password_error
			session[:current_errors] = []
			session[:current_errors] << "Oops, incorrect password. Try again"
		end
	end
end
