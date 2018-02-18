class RegistrationController < ApplicationController

  get '/registration/signup' do
    erb :'/registration/signup'
  end

  post "/registrations" do
    user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])

    if user.save
        redirect "/login"
    else
        redirect "/failure"
    end
  end

  get '/failure' do
    erb :'registration/signupfail'
  end

end
