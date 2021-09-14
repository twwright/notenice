require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "saltyhashes"
  end

  get "/" do
    check_failure_message
    @logged_in = !!session[:user_id]
    erb :index
  end

  not_found do
    status 404
    erb :oops
  end

  helpers do
    def current_user
      @user = User.find_by_id(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

    def set_failure_message
      session[:failure_message] = []
      session[:failure_message] << "Failure"
    end

    def check_failure_message
      @failure_message = session[:failure_message]
      session[:failure_message] = nil
    end

    def has_note_access?
      logged_in? && @note.user == current_user
    end

    def has_user_access?
      logged_in? && @user == current_user
    end

    def assign_user_instance_by_params
      @user = User.find_by_id(params[:id])
    end

    def assign_user_instance_by_session
      @user = User.find_by_id(session[:user_id])
    end

    def assign_note_instance_by_params
      @note = Note.find_by_id(params[:id])
    end

    class CodeRayify < Redcarpet::Render::HTML
      def block_code(code, language)
        CodeRay.scan(code, language || :text).div
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
