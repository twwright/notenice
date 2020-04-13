require './config/environment'

class ApplicationController < Sinatra::Base

	configure do
	 set :public_folder, 'public'
	 set :views, 'app/views'
	 enable :sessions
	 set :session_secret, "saltyhashes"
	end

	get "/" do
		@failure_message = session[:failure_message]
		session[:failure_message] = nil
		@logged_in = !!session[:user_id]
		erb :index
	end

	helpers do
		def current_user
			@user = User.find_by_id(session[:user_id])
		end
			
		def logged_in?
			!!session[:user_id]
		end

		def logged_out_error
			session[:current_errors] = []
			session[:current_errors] << "Sorry, you must be logged in to view that page."
		end

		def password_error
			session[:current_errors] = []
			session[:current_errors] << "Oops, incorrect password. Try again"
        end
        
        class CodeRayify < Redcarpet::Render::HTML
            def block_code(code, language)
                CodeRay.scan(code, language).div
            end
        end

        def markdown(text)
            coderayified = CodeRayify.new(:filter_html => true, :hard_wrap => true)
            options = {
             :fenced_code_blocks => true,
             :no_intra_emphasis => true,
             :autolink => true,
             :lax_html_blocks => true,
            }
            markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
            markdown_to_html.render(text)
        end
	end
end
