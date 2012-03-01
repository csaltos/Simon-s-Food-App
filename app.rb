require "sinatra"
require "mogli"
require "sinatra/content_for"

enable :sessions
set :raise_errors, false
set :show_exceptions, false


unless ENV["FACEBOOK_APP_ID"] && ENV["FACEBOOK_SECRET"]
  abort("missing env vars: please set FACEBOOK_APP_ID and FACEBOOK_SECRET with your app credentials")
end

before do
  # HTTPS redirect
  if settings.environment == :production && request.scheme != 'https'
    redirect "https://#{request.env['HTTP_HOST']}"
  end
end




get "/channel" do
  script = "<script src=\"//connect.facebook.net/en_US/all.js\"></script>"
  erb script, :layout => false
end


get "/" do
  erb :index
end

get '/recipes/lasagne' do
  erb :lasagne
end

get '/recipes/thaigreencurry' do
  erb :thaigreencurry
end

get '/recipes/pizza' do
  erb :pizza
end

get '/ingredients/beef' do
  erb :beef
end

get '/ingredients/pasta' do
  erb :pasta
end

get '/occasions/birthday' do
  erb :birthday
end
