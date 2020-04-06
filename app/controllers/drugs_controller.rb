class DrugController < ApplicationController
	get '/drugs' do
		if logged_in?
			 @drugs = Drug.all
			 erb :'/drugs/show'
		else
			 logged_out_error
			 redirect '/login'
		end
  end

  post '/drugs/new' do

  end

end