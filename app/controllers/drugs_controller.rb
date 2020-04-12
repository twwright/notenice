class DrugsController < ApplicationController

#VIEW ALL DRUGS
	get "/drugs" do
		@drugs = Drug.all
		erb :"/drugs/index"
	end

# ADD A NEW DRUG
	get "/drugs/new" do
		if !!session[:user_id]
			@success_message = session[:creation_successful]
			session[:creation_successful] = nil
			@user = User.find(session[:user_id])
			erb :"/drugs/new"
		else
			redirect to "/"
		end
	end

# ADD NEW DRUG
	post "/drugs" do
		@drug = Drug.create(params[:drug])
		#if !params[:drug][:side_effect].empty?
		#	@drug.user = Owner.create(name: params[:owner][:name])
		#end
		@drug.save
		redirect to "drugs/#{@drug.id}"
	end

# VIEW A SPECIFIC DRUG
	get "/drugs/:id" do
		@drug = Drug.find(params[:id])
		erb :'/drugs/show'
	end

# UPDATE A DRUG
	get "/drugs/:id/edit" do
		@drug = Drug.find(params[:id])
		erb :"/drugs/edit"
	end

# UPDATE A DRUG 
	patch "/drugs/:id" do
		binding.pry
		@drug = Drug.find(params[:id])
		@drug.update(params[:drug])
		redirect to "/drugs/#{ @drug.id }"
	end

#COFNRIM DELETE FOR A SPECIFIC DRUG

	get "/drugs/:id/confirm-delete" do
		@drug = Drug.find(params[:id])
		erb :"/drugs/confirm-delete"
	end
	
	delete "/drugs/:id/delete" do
		redirect "/drugs"
	end
end
