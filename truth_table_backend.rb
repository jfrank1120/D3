# Jared Frank - jaf216@pitt.edu - jfrank1120
require 'sinatra'
require 'sinatra/reloader'

# Return true if data is valid else false
def check_data(true_val, false_val, size_val)
  if true_val.nil? || false_val.nil? || size_val.nil? || size_val.to_i < 2
    return true
  elsif true_val.length > 1 || false_val.length > 1
    return true
  elsif true_val == false_val
    return true
  else
    return false
  end
end

get '/' do
  erb :index
end

get '/submit' do
  true_val = params['true_sym']
  false_val = params['false_sym']
  size_val = params['size']
  if check_data true_val, false_val, size_val
      erb :error
  else
    erb :truth_table, :locals => {true_val: true_val, false_val: false_val, size_val: size_val }
  end
end

not_found do
  status 404
  erb :page_not_found
end
