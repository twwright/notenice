class NotesController < ApplicationController

#VIEW ALL NOTES
	get "/notes" do
		@notes = Note.all
		erb :"/notes/index"
	end

# ADD A NEW DRUG
	get "/notes/new" do
		if !!session[:user_id]
			@success_message = session[:creation_successful]
			session[:creation_successful] = nil
            @user = User.find(session[:user_id])
			erb :"/notes/new"
		else
			redirect to "/"
		end
	end

# ADD NEW DRUG
    post "/notes" do
        binding.pry
        @note = Note.create(params[:note])
		#if !params[:note][:side_effect].empty?
		#	@note.user = Owner.create(name: params[:owner][:name])
		#end
		@note.save
		redirect to "notes/#{@note.id}"
	end

# VIEW A SPECIFIC DRUG
	get "/notes/:id" do
		@note = Note.find(params[:id])
		erb :'/notes/show'
	end

# UPDATE A DRUG
	get "/notes/:id/edit" do
		@note = Note.find(params[:id])
		erb :"/notes/edit"
	end

# UPDATE A DRUG 
	patch "/notes/:id" do
		@note = Note.find(params[:id])
		@note.update(params[:note])
		redirect to "/notes/#{ @note.id }"
	end

#COFNRIM DELETE FOR A SPECIFIC DRUG

	get "/notes/:id/confirm-delete" do
		@note = Note.find(params[:id])
		erb :"/notes/confirm-delete"
	end
	
	delete "/notes/:id/delete" do
		redirect "/notes"
	end
end
