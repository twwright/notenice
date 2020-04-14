class UsersController < ApplicationController

	get "/users/new" do
		if !!session[:user_id]
			redirect '/notes'
		else
			@failure_message = session[:failure_message]
			session[:failure_message] = nil
			erb :'/users/new'
		end
	end

	post "/users" do
		user = User.new(params[:user])
		if user.save 
				session[:user_id] = user.id
				session[:creation_successful] = []
				session[:creation_successful] << "Account created successfully!"
				redirect '/users/profile'
		else 
				session[:failure_message] = user.errors.messages
				redirect '/users/new'
		end
	end

	post '/login' do
		@user = User.find_by(:username => params[:username])
	 	if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id 
			redirect to '/users/profile'
		else 
			session[:failure_message] = []
			session[:failure_message] << "Failure"
			redirect to '/'
		end
	end

	get "/users/:id" do
		@user = User.find_by_id(session[:user_id])
		if @user
			@notes = Note.where(user_id: session[:user_id]) 
			erb :"/users/profile"
		else 
			redirect to "/"
		end
	end

	get "/users/:id/edit" do
		@user = User.find(params[:id])
		if has_user_access?
			erb :"/users/edit"
		else
			redirect to "/users/#{ @user.id }"
		end
	end
# CHECK TO SEE IF WE NEED TO BYPASS VALIDATIONS ALWAYS OR ONLY
# THAT ONE TIME BECAUSE RECORD WAS MADE BEFORE UPDATES?
	patch "/users/:id" do
		@user = User.find(params[:id])
		if has_user_access?
			@user.name = params[:user][:name]
			@user.profile = params[:user][:profile]
			@user.save(validate: false)
			redirect to "/users/#{ @user.id }"
		else
			redirect to "/users/#{ @user.id }"
		end
	end

	get '/logout' do
		session.clear
		redirect to '/'
	end

	delete "/users/:id/delete" do
		@user = User.find(params[:id])
		if has_user_access?
			@user.delete
			redirect to "/users/#{ @user.id }"
		else
			redirect to "/"
		end
	end
end
