class Number < ActiveRecord::Base
    

    def fill_table
        @draws = Draw.all
        @draws.each do |draw|
            arr = draw.winning_numbers.split(" ").first(5)
           @number = Number.new(add_data(arr))
        end
    end



    
    def add_data (draw)
        hash = Hash.new
        (1..69).each do |num|
            b = "num_#{num}"
            if draw.include?(num)
            hash[b]=1
            else
            hash[b] = 0
            end
        end
        hash
    end


end