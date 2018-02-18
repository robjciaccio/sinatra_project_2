class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public/stylesheets'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret_password"
  end

  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end



end
