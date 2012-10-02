require 'rubygems'
require 'sinatra'
require 'tilt/haml'
require '../app/controllers/authentication'
require '../app/controllers/main'
require '../app/controllers/purchase'
require '../app/controllers/list_users'
require '../app/controllers/activate'
require '../app/controllers/deactivate'
require '../app/models/trading/user'
require '../app/models/trading/item'


class App < Sinatra::Base

  #Logging in
  use Authentication
  use Main
  #the buying transaction
  use Purchase
  #activate an item
  use Activate
  #deactivate an item
  use Deactivate
  use ListUsers

  enable :sessions
  set :public_folder, 'app/public'

  configure :development do
    #Users
    benji = Trading::User.named("benji")
    benji.save
    joshua = Trading::User.named("joshua")
    joshua.save
    ese = Trading::User.named("ese")
    ese.save

    #Items
    chair = Trading::Item.make("chair", 70)
    table = Trading::Item.make("table", 200)
    plate = Trading::Item.make("plate", 30)
    glass = Trading::Item.make("glass", 15)
    chair.active = true
    table.active = true
    plate.active = true
    benji.add_item(chair)
    benji.add_item(table)
    benji.add_item(plate)
    benji.add_item(glass)

    desktop = Trading::Item.make("desktop", 110)
    laptop = Trading::Item.make("laptop", 70)
    bass = Trading::Item.make("Fender Bass", 150)
    amp = Trading::Item.make("amplifier", 40)
    desktop.active = true
    laptop.active = true
    bass.active = true
    joshua.add_item(desktop)
    joshua.add_item(laptop)
    joshua.add_item(bass)
    joshua.add_item(amp)

    book = Trading::Item.make("book", 30)
    radio = Trading::Item.make("radio", 50)
    car = Trading::Item.make("car", 300)
    lamp = Trading::Item.make("antique lamp", 90)
    book.active = true
    radio.active = true
    car.active = true
    ese.add_item(book)
    ese.add_item(radio)
    ese.add_item(car)
    ese.add_item(lamp)

  end
end

App.run!