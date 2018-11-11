require 'sinatra'
require 'sinatra/reloader'


get '/' do

  erb :index, :locals => {  }
end



not_found do
  status 404
  erb :error
end
