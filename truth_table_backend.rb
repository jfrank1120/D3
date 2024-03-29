# Jared Frank - jaf216@pitt.edu - jfrank1120
require 'sinatra'
require 'sinatra/reloader'

# Return true if data is valid else false
def check_data(true_val, false_val, size_val)
  # Check if size was set
  unless size_val == ''
      if size_val.to_i < 2
        return true
      end
  end
  # Check if true was set
  unless true_val == ''
    if true_val.length > 1
      return true
    end
  end
  unless false_val == ''
    if false_val.length > 1
      return true
    end
  end
  unless true_val == '' && false_val == ''
      if true_val == false_val
          return true
      end
  end
  return false
end

get '/' do
  erb :index
end

get '/submit' do
  true_val = params['true_sym']
  false_val = params['false_sym']
  size_val = params['size']
  puts size_val
  if check_data true_val, false_val, size_val
      erb :error
  else
    if true_val == ''
      true_val = 'T'
    end
    puts false_val.nil?
    if false_val == ''
      false_val = 'F'
    end
    if size_val == ''
        size_val = '3'
    end
    erb :truth_table, :locals => {true_val: true_val, false_val: false_val, size_val: size_val }
  end
end

not_found do
  status 404
  erb :page_not_found
end
