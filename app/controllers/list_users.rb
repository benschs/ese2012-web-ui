require 'tilt/haml'
require '../app/models/trading/user'

class ListUsers < Sinatra::Application

  get '/list_users' do
    haml :users, :locals => { :time => Time.now,
                              :users => Trading::User.all}
  end

  post '/list_users' do

  end


end