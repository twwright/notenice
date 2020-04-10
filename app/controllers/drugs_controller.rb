class DrugsController < ApplicationController

#VIEW ALL DRUGS
  get "/drugs" do
    erb :"/drugs/index"
  end

#ADD A NEW DRUG
  get "/drugs/new" do
	if !!session[:user_id]
		@success_message = session[:creation_successful]
		session[:creation_successful] = nil
		@user = User.find(session[:user_id])
		erb :"/drugs/new"
	else
		erb :"/users/new"
	end
  end

#ADD A NEW DRUG SUBMISSION
	post "/drugs" do
		binding.pry
		@drug = Drug.create(name: params[:drug][:name], side_effect: params[:drug][:side_effect], user_id: params[:drug][:user_id])
		#if !params[:drug][:side_effect].empty?
		#  @drug.user = Owner.create(name: params[:owner][:name])
		#end
		@drug.save
		redirect to "drugs/#{@drug.id}"
	end

#VIEW A SPECIFIC DRUG
  get "/drugs/:id" do
	@drug = Drug.find(params[:id])
	binding.pry
	erb :'/drugs/show'
  end

#EDIT A SPECIFIC DRUG
  get "/drugs/:id/edit" do
    erb :"/drugs/edit"
  end

#EDIT A SPECIFIC DRUG SUBMISSION
  patch "/drugs/:id" do
    redirect "/drugs/:id"
  end

#DELETE A SPECIFIC DRUG
  delete "/drugs/:id/delete" do
    redirect "/drugs"
  end
end
