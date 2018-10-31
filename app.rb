require './environment'
require 'pry'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :root
    end

    # one to serve up the form (GET)
    get '/new' do
      erb :"pirates/new"
    end

    # one to process the data from the form (POST)
    post '/pirates' do
      # binding.pry
      @pirate = Pirate.new(params[:pirate])

      params[:pirate][:ships].each do |details|
        # binding.pry
        Ship.new(details[:name], details[:type], details[:booty])
      end

      # binding.pry
      # Ship.new(params[:pirate][:ships][0][:name], type, booty) # keys
      # name

      @ships = Ship.all

      erb :"pirates/show"

    end

  end
end
