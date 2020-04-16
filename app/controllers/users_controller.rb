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
		@user = User.new(params[:user])
		if user.save 
				session[:user_id] = user.id
				session[:creation_successful] = []
				session[:creation_successful] << "Account created successfully!"
				redirect to "/users/#{ @user.id }"
		else 
				session[:failure_message] = user.errors.messages
				redirect '/users/new'
		end
	end

	post '/login' do
		@user = User.find_by(:username => params[:username])
	 	if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id 
			redirect to "/users/#{ @user.id }"
		else 
			session[:failure_message] = []
			session[:failure_message] << "Failure"
			redirect to '/'
		end
	end

	get "/users/:id" do
		assign_user_instance_by_params
		if @user
			@success_message = session[:creation_successful]
			session[:creation_successful] = nil
			@notes = Note.where(user_id: params[:id]) 
			erb :"/users/profile"
		else
			redirect to "/users"
		end
	end

	get "/users/:id/edit" do
		assign_user_instance_by_params
		if has_user_access?
			erb :"/users/edit"
		else
			redirect to "/users/#{ @user.id }"
		end
	end

	patch "/users/:id" do
		assign_user_instance_by_params
		if has_user_access?
			@user.name = params[:user][:name]
			@user.profile = params[:user][:profile]
			@user.save(validate: false) #SKIPS VALIDATIONS
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
		assign_user_instance_by_params
		if has_user_access?
			@user.delete
			redirect to "/users/#{ @user.id }"
		else
			redirect to "/"
		end
	end
end
