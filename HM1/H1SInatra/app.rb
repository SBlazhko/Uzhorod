require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/reloader'
require './app/models/user'

class MyApp < Sinatra::Base

    register Sinatra::Reloader
    enable :sessions

#Starting page
get '/' do
  redirect to '/login'
end

#Get list of user
get '/listofuser' do
  if session['log']=='admin' && session['pass']=='1221'
  @users = User.all
  erb :listofuser
else
  redirect to '/user/' + session['log']
end
end

#Get Registration form
get '/registration' do
  erb :registration_form
end

#Get login form
get '/login' do
  erb :login_form
end

#Login exist user
post '/login' do
  if params['login'] == ""
    redirect to '/login'
  else
    if User.find_by(login: params['login'], password: params['password'])
      session['log'] = params['login']
      session['pass'] = params['password']
      redirect to "/user/#{params[:login]}"
    else redirect to '/login'
  end
end
end

#Get user personall page
get '/user/:login' do
  user = User.find_by(login: params['login'])
    if user
      if user.login==session['log'] && user.password==session['pass']
        erb :userpage
      else
        "<a href=/><h5>You aren't enter chiter</h5></a>"
      end
else
  "<a href=/><h5>This user not found</h5></a>"
end
end

#Create new user
post '/registration' do
  if params['login'] == ""
    redirect to '/registration'
  elsif User.find_by(login: params['login'])
    redirect to '/registration'
  else
  User.create(login: params['login'], password: params['password'])
  redirect to '/login'
end
end

#Delete user from database
post '/user/:login' do
  user = User.find_by(login: params['login'])
  user.destroy
  redirect to '/login'
end

#Get password Updater
get '/update' do
  erb :update_user_data
end

#Update password
post '/update' do
  user = User.find_by(login: params['login'], password: params['oldP'])
  user.update(password: params['newP'])
  redirect to '/login'
end

#Update sessions to nil
post '/update/sessions' do
  session['log'] = nil
  session['pass'] = nil
  redirect to '/'
end
  run!
 end

