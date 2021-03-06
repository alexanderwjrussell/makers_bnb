class MakersBnB < Sinatra::Base

  get '/spaces/new' do
    redirect '/session/new' if !current_user
    erb :'spaces/new'
  end

  post '/spaces/new' do
    @space = Space.new(params.merge(user: current_user))
    if @space.save
      #success!
    else
      @space.errors.each {|e| puts e}
    end

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
