class DrugsController < ApplicationController

#VIEW ALL DRUGS
  get "/drugs" do
	@drugs = Drug.all
	binding.pry
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
		binding.pry
		@drug = Drug.create(params[:drug])
		#if !params[:drug][:side_effect].empty?
		#  @drug.user = Owner.create(name: params[:owner][:name])
		#end
		@drug.save
		redirect to "drugs/#{@drug.id}"
	end

# VIEW A SPECIFIC DRUG
  get "/drugs/:id" do
	@drug = Drug.find(params[:id])
	erb :'/drugs/show'
  end


# LOG DRUG WITH YOUR SIDE-EFFECTS
  get "/drugs/:id/edit" do
    erb :"/drugs/edit"
  end

# LOG DRUG WITH YOUR SIDE-EFFECTS SUBMISSION
  patch "/drugs/:id" do
    redirect "/drugs/:id"
  end

#DELETE A SPECIFIC DRUG
  delete "/drugs/:id/delete" do
    redirect "/drugs"
  end
end
