
class BoardController < ApplicationController
    get '/board' do
        erb :'/board/index'
    end

    get "/board/new" do
        binding.pry
        erb :'/board/new'
    end

    # post '/board' do 
    #     binding.pry
    #     @board = Board.create(params["board"])
    #     @board.landmarks << Landmark.create(params[:landmark]) unless params[:landmark][:name].emty?
    #     @board.titles << Title.create(params[:title]) unless params[:title][:name].emty?
    #     redirect to :"/board/"
    # end



end