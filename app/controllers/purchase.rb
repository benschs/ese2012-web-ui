require 'tilt/haml'

class Purchase < Sinatra::Application

  get '/buy' do
    redirect '/'
  end

  post '/buy' do
    owner_name = params[:owner]
    buyer_name = session[:name]
    item_name = params[:item_name]

    buyer = Trading::User.by_name(buyer_name)
    owner = Trading::User.by_name(owner_name)
    item = owner.list_items.detect {|item| item.name == item_name}


    if buyer.buy_item(item)
      session[:message] = "Thank you for buying at #{owner_name}'s shop!"
    else
      session[:message] = "You Don't have enough money to buy #{item.name}"
    end

    redirect '/'
  end


end