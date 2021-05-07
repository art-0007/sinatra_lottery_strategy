require './config/environment'
require "./app/models/user"

class ApplicationController < Sinatra::Base
  set :views, proc { File.join(root, '../views/') }
  register Sinatra::Twitter::Bootstrap::Assets
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/logo" do
    erb :index
  end

  get "/" do
    erb :'/application/welcome'
  end

  get "/failure" do
    erb :failure
  end

  get "/application/signup" do
    erb :'/application/welcome'
  end

  post "/application/signup" do
    #your code here
    #binding.pry
    @user = User.new(:username => params[:email], :password => params[:psw])
    
		if params[:email] == ""
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

  post "/application/login" do
    ##your code here
    binding.pry
    @user = User.find_by(:username => params[:username])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect "/application/account"
		  else
			redirect "/failure"
		  end
  end

  get '/application/account' do
    @user = current_user
    erb :'/application/account'
  end

  post '/application/account' do
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
    erb :'/application/account'
  end

  get "/failure" do
    erb :failure
  end

  get "/application/logout" do
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

