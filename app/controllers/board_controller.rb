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
        
        @board.name = params[:board][:name] unless params[:board][:name].empty?
        @board.preference_num1 = params[:preference_num1] unless params[:board][:preference_num1].empty?
        @board.preference_num2 = params[:board][:preference_num2] unless params[:board][:preference_num2].empty?
        @board.preference_num3 = params[:board][:preference_num3] unless params[:board][:preference_num3].empty?
        @board.preference_num4 = params[:board][:preference_num4] unless params[:board][:preference_num4].empty?
        @board.preference_num5 = params[:board][:preference_num5] unless params[:board][:preference_num5].empty?
        @board.preference_PB = params[:board][:preference_PB] unless params[:board][:preference_PB].empty?
        @board.LUCKY_DAY_1 = params[:board][:LUCKY_DAY_1] unless params[:board][:LUCKY_DAY_1].empty?
        @board.LUCKY_DAY_2 = params[:board][:LUCKY_DAY_2] unless params[:board][:LUCKY_DAY_2].empty?
        @board.LUCKY_DAY_3 = params[:board][:LUCKY_DAY_3] unless params[:board][:LUCKY_DAY_3].empty?
        @board.save
        redirect to :"/board/#{Board.last.id}"
      end
    
      
      delete "/board/:id"  do
        @board = Board.find(params[:id])
        @board.destroy
        redirect :'/board'
      end



end