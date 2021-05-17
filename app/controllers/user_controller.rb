
class UserController < ApplicationController

    get '/users/index' do
        @user = current_user
        @boards = Board.all
        #binding.pry
        erb :'/users/index'
    end

    get "/users/login" do
     erb :'users/login'
    end

    post "/users/login" do
        @user = User.find_by(:username => params[:username])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect "/users/index"
		else
			redirect "/failure"
		end
    end

    get '/users/:id' do

        @user = User.find(params[:id])
        erb :'users/index'
      end
    
      
      get '/users/:id/edit' do 
        if !logged_in?
          redirect  "/users/login"
        else
        @user =  User.find(params[:id])
        end
        erb :'/users/edit'
      end
    
      
    
      patch '/users/:id' do 
        #binding.pry
        @user =  User.find(params[:id])
        
        @user.name = params[:name] unless params[:name].empty?
        @user.username = params[:username] unless params[:username].empty?
        @user.password = params[:password] unless params[:password].empty?
        @user.save
        redirect :"/"
      end
    
      
      delete "/users/:id"  do
        @user = User.find(params[:id])
        @user.destroy
        redirect :'/application/welcome'
      end

      

end