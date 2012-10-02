require 'tilt/haml'

class Deactivate < Sinatra::Base

  get '/deactivate' do
    redirect '/'
  end

  post '/deactivate' do
    owner_name = session[:name]
    owner = Trading::User.by_name(owner_name)
    item = owner.list_items.detect {|item| item.name == params[:item_name]}
    item.active = false

    redirect '/'
  end


end
