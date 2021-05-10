
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
    ##your code here
        binding.pry
        @user = User.find_by(:username => params[:username])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect "/users/index"
		else
			redirect "/failure"
		end
    end

end