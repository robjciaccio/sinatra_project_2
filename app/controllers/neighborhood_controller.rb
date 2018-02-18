class NeighborhoodController < ApplicationController

  get '/neighborhood/new' do
    erb :'neighborhood/new'
  end

  post '/neighborhood/new' do
    Neighborhood.create(:name => :name)

    redirect '/listing/new'
  end


end
