class MakersBnB < Sinatra::Base

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    @spaces = Space.create(space_name: params[:space_name],
                      description: params[:description],
                      price_per_night: params[:price_per_night],
                      available_from: params[:available_from],
                      available_to: params[:available_to])
    redirect('/spaces')
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/spaces'
  end

  post '/spaces' do
    @spaces = filter_available_spaces(params[:available_on])
    erb :'spaces/spaces'
  end

  get '/spaces/:id' do
    @space = Space.first(id: params[:id])
    erb :'spaces/space'
  end

end
