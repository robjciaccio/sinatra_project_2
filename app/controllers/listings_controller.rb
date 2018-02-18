require 'pry'
class ListingsController < ApplicationController

  get '/listing/new' do
    if logged_in?
      erb :'listings/new'
    else
      redirect '/login'
    end
  end

  post '/listing/new' do
    if logged_in?
      listing = Listing.new(:description => params["description"], :price => params["price"], :neighborhood => params["neighborhood"])
      listing.user_id = current_user.id
      listing.save
      redirect '/success'
    else
      redirect '/login'
    end
  end

  get '/error' do
    erb :'users/error'
  end

  post '/listing/show' do
    if logged_in?
      @listing = Listing.find_by_id(params[:id])
      if @listing.user_id == current_user.id
        erb :'listings/show'
      else
        redirect '/error'
      end
    end
  end

  get '/listing/:id/edit' do
    if logged_in?
      @listing = Listing.find_by_id(params[:id])
      if @listing.user_id == current_user.id
        erb :'listings/edit'
      else
        redirect '/success'
      end
    else
      redirect '/login'
    end
  end

  post '/listing/:id' do
    if logged_in?
      if params[:description] == ""
        redirect to '/listing/:id/edit'
      else
        @listing = Listing.find_by_id(params[:id])
        if @listing.id == current_user.id
          @listing.update(description: params[:description])
          redirect "/success"
        else
          redirect "/success"
        end
      end
    end
  end

  post '/listing/:id/delete' do
    if logged_in?
      @listing = Listing.find_by_id(params[:id])
      if @listing.user_id == current_user.id
        @listing.delete
        redirect '/success'
      end
      redirect '/success'
    else
      redirect '/login'
    end
  end
end
