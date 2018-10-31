require './environment'
require 'pry'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :'pirates/new'
    end

    post '/pirates' do
      @pirate = Pirate.new(params["name"], params["weight"], params["height"])

      Ship.clear

      params["pirate"]["ships"].each do |details|
        Ship.new(details)
      end

      @ship1 = Ship.all[0]
      @ship2 = Ship.all[1]

      erb :'pirates/show'
    end

  end
end
