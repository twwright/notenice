class UsersController < ApplicationController

#CREATE NEW USER PAGE
	get "/users/new" do
		if !!session[:user_id]
			redirect '/notes'
		else
			@failure_message = session[:failure_message]
			session[:failure_message] = nil
			erb :'/users/new'
		end
	end

#CREATE NEW USER FORM SUBMISSION
	post "/users" do
		user = User.new(username: params[:username], password: params[:password])
		if user.save
				session[:user_id] = user.id
				session[:creation_successful] = []
				session[:creation_successful] << "Account created successfully!"
				redirect '/notes/new'
		else 
				session[:failure_message] = user.errors.messages
				redirect '/users/new'
		end
	end

#LOG IN USER FORM SUBMISSION
	post '/login' do
		@user = User.find_by(:username => params[:username])
	 	if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id 
			redirect to '/notes/new'
		else 
			session[:failure_message] = []
			session[:failure_message] << "Failure"
			redirect to '/'
		end
	end

#VIEW USER'S PROFILE PAGE
	get "/users/profile" do
		if logged_in?
			@user = User.find_by_id(session[:user_id])
			if @user
				@notes = Note.where(user_id: session[:user_id]) 
				erb :"/users/profile"
			else 
				erb :new
			end
		else
			redirect to "/users/new"
		end
	end

#EDIT USER'S PROFILE PAGE
	get "/users/:id/edit" do
		erb :"/users/edit"
	end

#EDIT USER'S PROFILE PAGE SUBMISSION
	patch "/users/:id" do
		redirect "/users/:id"
	end

#LOG OUT OF PROFILE
	get '/logout' do
		session.clear
		redirect to '/'
	end

#DELETE USER'S PROFILE
	delete "/users/:id/delete" do
		redirect "/users"
	end
end
