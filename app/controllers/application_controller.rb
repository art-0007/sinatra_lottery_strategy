require './config/environment'
require "./app/models/user"

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/application/index" do
    erb :"/application/index"
  end

  get "/" do
    erb :'/application/welcome'
  end

  get "/application/signup" do
    erb :'/application/welcome'
  end

  post "/application/signup" do
    binding.pry
    @user = User.new(:username => params[:email], :password => params[:psw])
    
		if params[:email] == ""
      redirect "/failure"
    elsif params[:psw] != params[:psw_repeat]
      redirect "/failure"
    else @user.save
			redirect "/users/login"
		end

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

    def top_5_largest_jackpots
      @@doc = Nokogiri::HTML(open(SITE))
      @@doc.css("div section")[1].text
    end
  end

end

