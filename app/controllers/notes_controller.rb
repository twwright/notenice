class NotesController < ApplicationController

	get "/notes" do
		@notes = Note.all
		check_failure_message
		erb :"/notes/index"
	end

	get "/notes/new" do
		if logged_in?
			assign_user_instance_by_session
			erb :"/notes/new"
		else
			redirect to "/users/new"
		end
	end

	post "/notes" do
		@note = Note.create(params[:note])
		@note.user = current_user
		@note.save
		redirect to "notes/#{ @note.id }"
	end

	get "/notes/:id" do
		assign_note_instance_by_params
		if @note && ( @note.public || has_note_access? )
			binding.pry
			erb :'/notes/show'
		else
			set_failure_message
			redirect to "/notes"
		end
	end

	post "/notes/copy/:id" do
		assign_note_instance_by_params
		if @note.public #PROTECTS FROM HTTP POST REQUEST INJECTION TO COPY PRIVATE NOTES
			if logged_in?
				@note = Note.find(params[:id]).dup
				@note.user = current_user
				@note.save!(validate: false)
				redirect to "notes/#{ @note.id }"
			else
				redirect to "users/new"
			end
		else
			set_failure_message
			redirect to "/notes"
		end
	end

	get "/notes/:id/edit" do
		assign_note_instance_by_params
		if has_note_access?
				erb :"/notes/edit"
		else
				redirect "notes/#{ @note.id }"
		end
	end

	patch "/notes/:id" do
		assign_note_instance_by_params
		if has_note_access?
			@note.update(params[:note])
			binding.pry
			redirect to "/notes/#{ @note.id }"
		else
			redirect "notes/#{ @note.id }"
		end
	end

	delete "/notes/:id" do
		assign_note_instance_by_params
		if has_note_access?
			@note.destroy
			redirect to "/notes"
		else
			redirect to "/notes/#{ @note.id }"
		end
	end
end
