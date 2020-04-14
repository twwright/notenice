class NotesController < ApplicationController

	get "/notes" do
		@notes = Note.all
		erb :"/notes/index"
	end

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

	post "/notes" do
		@note = Note.create(params[:note])
		@note.save
		redirect to "notes/#{ @note.id }"
	end

	get "/notes/:id" do
		@note = Note.find(params[:id])
		erb :'/notes/show'
	end

	get "/notes/:id/edit" do
		@note = Note.find(params[:id])
		if has_note_access?
				erb :"/notes/edit"
		else
				redirect "notes/#{ @note.id }"
		end
	end

	patch "/notes/:id" do
		@note = Note.find(params[:id])
		if has_note_access?
			@note.update(params[:note])
			redirect to "/notes/#{ @note.id }"
		else
			redirect "notes/#{ @note.id }"
		end
	end

	delete "/notes/:id/delete" do
		@note = Note.find(params[:id])
		if has_note_access?
			@note.delete
			redirect to "/notes"
		else
			redirect to "/notes/#{ @note.id }"
		end
	end
end
