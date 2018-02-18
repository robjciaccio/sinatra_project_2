class UsersController < ApplicationController

  get '/users/home' do
    @user = User.find(session[:id])
    erb :'users/home'
  end

  get "/success" do
		if logged_in?
			erb :'users/home'
		else
			redirect "/login"
		end
	end

end
