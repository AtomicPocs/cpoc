require 'sinatra/base'
require 'faraday'

class App < Sinatra::Base
  get '/' do
    '{"message": "Im service C"}'
  end

  get '/ping' do
    ping
  end

  def ping
    url = Faraday.get 'http://www.mocky.io/v2/5de161a13200004260809390'
    response = '{"message":"pong from C [http://www.mocky.io/v2/5de161a13200004260809390 (external)]"}'
    response unless url.status != 200
  end
end
