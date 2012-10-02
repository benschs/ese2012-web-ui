require 'tilt/haml'
require '../app/models/trading/user'


class Main < Sinatra::Application

  get "/" do

    redirect '/login' unless session[:name]

    message = session[:message]
    session[:message] = nil
    haml :main, :locals => {:time => Time.now ,
                            :users => Trading::User.all,
                            :current_user => Trading::User.by_name(session[:name]),
                            :message => message}





  end

end