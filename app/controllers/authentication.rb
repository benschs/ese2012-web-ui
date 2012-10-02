require 'tilt/haml'
require '../app/models/trading/user'


class Authentication < Sinatra::Application

  get '/login' do
    haml :login
  end

  post '/login' do
    name = params[:username]
    password = params[:password]

    fail "incorrect username or password" if (name.nil? or password.nil?)

    use = Trading::User.by_name(name)
    fail "incorrect username or password" if (name.nil?)
    fail "name not equal password" if name != password

    session[:name] = name
    redirect '/'
  end

  get '/logout' do
    session[:name] = nil
    redirect '/login'
  end

end