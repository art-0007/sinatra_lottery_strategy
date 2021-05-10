
class BoardController < ApplicationController
    get '/board' do
        erb :'/board/index'
    end

    get '/board/new' do
        #binding.pry
        @user = current_user
        erb :'/board/new'
    end

    post '/board' do 
        #binding.pry
        @user = current_user
        @board = Board.create(params[:board])
        @board.user_id = @user.id
        @user.boards << @board 
        redirect to :"/board/#{Board.last.id}"
    end

    get '/board/:id' do
        #binding.pry
        @board = Board.find(params[:id])
        erb :'board/index'
      end
    
      
      get '/board/:id/edit' do  
        @board = Board.find_by_id(params[:id])
        #binding.pry
        erb :'/board/edit'
      end
    
      
    
      patch '/board/:id' do 
        binding.pry
        @board = Board.find_by_id(params[:id])
        
        @board.name = params[:name]
        @board.preference_num1 = params[:preference_num1]
        @board.preference_num2 = params[:preference_num2]
        @board.preference_num3 = params[:preference_num3]
        @board.preference_num4 = params[:preference_num4]
        @board.preference_num5 = params[:preference_num5]
        @board.preference_PB = params[:preference_PB]
        @board.LUCKY_DAY_1 = params[:LUCKY_DAY_1]
        @board.LUCKY_DAY_2 = params[:LUCKY_DAY_2]
        @board.LUCKY_DAY_3 = params[:LUCKY_DAY_3]
        @board.save
        redirect to :"/board/index"
      end
    
      
      delete "/board/:id"  do
        @board = Board.find(params[:id])
        @board.destroy
        redirect :'/board'
      end



end