require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :"/root"
    end

    get '/pirates/new' do
      erb :"/pirates/new"
    end

   post '/pirates' do
     @pirate = Pirate.new(params[:pirate])

     params[:pirate][:ships].each do |data|
       Ship.new(data)
     end

     @ships = Ship.all
       erb :"/pirates/show"
    end
  end

end
