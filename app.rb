require './environment'

module FormsLab
  class App < Sinatra::Base
    # set :views, '/views'
    
    get '/' do 
      erb :root
    end

    # code other routes/actions here
    get '/new' do 
      erb :'/pirates/new'
    end

  post '/pirates' do
    
    # binding.pry
    
    #model
    @pirate = Pirate.new(params[:pirate])

    params[:pirate][:ships].each do |details|
      Ship.new(details)
    end
    @ships = Ship.all
    erb :'/pirates/show'
  end

   end
end #end of app class
