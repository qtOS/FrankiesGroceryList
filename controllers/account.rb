class AccountController < ApplicationController
  get '/' do
    #any resource, an authorization_check happening
    authorization_check
    @user_name = session[:current_user].user_name
    erb :home
  end

  get '/not_authorized' do
    erb :not_authorized
  end
  get '/register' do
    erb :register
  end

  post '/register' do
    p params

    #check if the iser sp,epme os trying to register exists or not
    if does_user_exist(params[:username]) == true
      return {:message => 'womp, womp... user exists'}.to_json
    end
    #~~~~ user doesn't exists past this point
    user = Account.create(user_email: params[:user_email], user_name: params[:user_name], password: params[:password])

    p user

    session[:current_user] = user

    redirect '/' #instead of view, redirect to a route

  end


  ## login
  get '/login' do
    erb :login
  end

  post '/login' do
    user = Account.authenticate(params[:user_name], params[:password])
    if user
      session[:current_user] = user
      redirect '/'
    else
      @message = 'Your password or account is incorrect'
      erb :login
  end

  get '/logout' do
    authorization_check
    session[:current_user] = nil
    redirect '/'
  end
end
