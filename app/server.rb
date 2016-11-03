class MakersBnB < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  use Rack::MethodOverride
  register Sinatra::Flash

  include Helpers

  get '/' do
    @spaces = Space.all
    erb :'spaces/spaces'
  end

  run! if app_file == $0
end
