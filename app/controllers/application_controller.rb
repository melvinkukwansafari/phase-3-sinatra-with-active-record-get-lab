class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
    # add routes
  get '/bakeries' do
      # get all the games from the database
     # return a JSON response with an array of all the game data
     # get all the games from the database
     bakeries = Bakery.all.order(:title).limit(10)
     # look up the game in the database using its ID
      
     # return a JSON response with an array of all the game data
     bakeries.to_json
  end

  get '/bakeries/:id' do
     # get all the games from the database
      # return a JSON response with an array of all the game data
     # get all the games from the database
     bakeries = Bakery.all.order(:title).limit(10)
     # look up the game in the database using its ID
      bakery = Bakery.find(params[:id])
     # return a JSON response with an array of all the game data
      bakery.to_json(
      include: :baked_goods
     )

  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    BakedGood.all.order(price: :desc)[0].to_json
  end

end
