# Jared Frank - jaf216@pitt.edu - jfrank1120
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  puts "Page Loaded"
  erb :index
end

get '/submit' do
  puts 'Submitting Data to be checked'
  true_val = params['true_sym']
  false_val = params['false_sym']
  size_val = params['size']
  unless (true_val.nil? || false_val.nil? || size_val.nil? || size_val.to_i > 2)
      erb :error
  else
    puts 'Values are valid'
    puts 'displaying truth table'
    erb :truth_table, :locals => {true_val: true_val, false_val: false_val, size_val: size_val }
  end
end

not_found do
  status 404
  erb :page_not_found
end
