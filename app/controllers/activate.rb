require 'tilt/haml'

class Activate < Sinatra::Base

  get '/activate' do
    redirect '/'
  end

  post '/activate' do
    owner_name = session[:name]
    owner = Trading::User.by_name(owner_name)
    item = owner.list_items.detect {|item| item.name == params[:item_name]}
    item.active = true

    redirect '/'
  end


end