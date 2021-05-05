require './config/environment'
require "./app/models/user"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :welcome
  end

  get "/signup" do
    erb :welcome
  end

  post "/signup" do
    #your code here
    binding.pry
    @user = User.new(:username => params[:username], :password => params[:password])
    
		if params[:username] == ""
      redirect "/failure"
    elsif !@user.save
      redirect "/failure"
    else @user.save
			redirect "/login"
		end
    
  end


  get "/login" do
    erb :login
  end

  post "/login" do
    ##your code here
    #binding.pry
    @user = User.find_by(:username => params[:username])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect "/account"
		  else
			redirect "/failure"
		  end
  end

  get '/account' do
    @user = current_user
    erb :account
  end

  post '/account' do
    @user = User.find(session[:user_id])
    @balance = @user.balance
    @wd = params[:withdrawal].to_i
    @dep = params[:deposit].to_i
    if @wd > 0
      @balance = @balance - @wd unless @wd > @balance
      @user.save
    elsif @dep > 0 
        @balance = @balance + @dep
    end
      @user.balance = @balance
      @user.save
    erb :account 
  end

  get "/failure" do
    erb :failure
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end

