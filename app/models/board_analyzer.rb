class BoardAnalyzer 
    attr_reader :board_data, :boards, :numbers, :draws
  
    def initialize(board_data, numbers = Number.all, draws = Draw.all, boards = Board.all)
      @board_data = board_data
      @numbers = numbers
      @draws = draws
      @boards = boards
    end

    def find_a_draw_by_date(date)
        right_draw = @draws.detect {|draw| draw.draw_date <= date }   
    end

    def find_num_by_lucky_days
        days = []
        days << @board_data.LUCKY_DAY_1
        days << @board_data.LUCKY_DAY_2
        days << @board_data.LUCKY_DAY_3
        arr_1 = []
        arr_2 = []
        days.each do |el|
            lucky_result = find_a_draw_by_date(el)
            result = lucky_result.winning_numbers.split(" ").map(&:to_i).first(5)
            arr_1 << result
            arr_1
            arr_2 << lucky_result.winning_numbers.split(" ").map(&:to_i).last
        end
        array = []
        array << arr_1.flatten.uniq.shuffle.first(5)
        array << arr_2.shuffle.first
        array

    end

    def counted_num
        @count = Hash.new(0)
        @draws.each do |arr|
            arr_1 = arr.winning_numbers.split(" ").map(&:to_i).first(5)
            arr_1.each do |num|
                @count[num] +=1
            end
        end  
        @count
    end
  
    def rarely_dropped_numbers
        numbers = counted_num.sort_by { |k, v| v }.first(5)
        numbers.to_h
    end
  
    def frequently_dropped_numbers
        numbers = counted_num.sort_by { |k, v| v }.last(5)
        numbers.reverse.to_h 
    end

    def long_standing_numbers
        
        array = Array(1..69)
        @draws.each do |arr|
        win_num_5 = arr.winning_numbers.split(" ").map(&:to_i).first(5)
        win_num_5.each do |num|
            if array.length<=5
            break
            else
            array.delete(num) 
            end
        end
    end
    array
    end

    def long_standing_powerball
        array = Array(1..26)
        @draws.each do |arr|
            powerball = arr.winning_numbers.split(" ").map(&:to_i).last
                if array.length==1
                break
                else
                array.delete(powerball) 
                end
        end
        array
    end

    def long_standing_powerball
        array = Array(1..26)
        @draws.each do |arr|
            powerball = arr.winning_numbers.split(" ").map(&:to_i).last
                if array.length==1
                break
                else
                array.delete(powerball) 
                end
        end
        array
    end

    def mix_strategy
        
        ticket = []
       # binding.pry
    # while ticket.uniq.size != 6
        case @board_data.preference_num1
        when 1  
            ticket << rarely_dropped_numbers.keys.shuffle.first
        when 2  
            ticket << frequently_dropped_numbers.keys.shuffle.first
        when 3  
            ticket << long_standing_numbers.shuffle.first
        when 4  
            ticket << find_num_by_lucky_days.shuffle.first
        end

        case @board_data.preference_num2
        when 1  
            ticket << rarely_dropped_numbers.keys.shuffle.first
        when 2  
            ticket << frequently_dropped_numbers.keys.shuffle.first
        when 3  
            ticket << long_standing_numbers.shuffle.first
        when 4  
            ticket << find_num_by_lucky_days.shuffle.first
        end

        case @board_data.preference_num3
        when 1  
            ticket << rarely_dropped_numbers.keys.shuffle.first
        when 2  
            ticket << frequently_dropped_numbers.keys.shuffle.first
        when 3  
            ticket << long_standing_numbers.shuffle.first
        when 4  
            ticket << find_num_by_lucky_days.shuffle.first
        end

        case @board_data.preference_num4
        when 1  
            ticket << rarely_dropped_numbers.keys.shuffle.first
        when 2  
            ticket << frequently_dropped_numbers.keys.shuffle.first
        when 3  
            ticket << long_standing_numbers.shuffle.first
        when 4  
            ticket << find_num_by_lucky_days.shuffle.first
        end

        case @board_data.preference_num5
        when 1  
            ticket << rarely_dropped_numbers.keys.shuffle.first
        when 2  
            ticket << frequently_dropped_numbers.keys.shuffle.first
        when 3  
            ticket << long_standing_numbers.shuffle.first
        when 4  
            ticket << find_num_by_lucky_days.shuffle.first
        end

        case @board_data.preference_PB
        when 1  
            ticket << rarely_dropped_numbers.keys.shuffle.first
        when 2  
            ticket << frequently_dropped_numbers.keys.shuffle.first
        when 3  
            ticket << long_standing_numbers.shuffle.first
        when 4  
            ticket << find_num_by_lucky_days.shuffle.first
        end
   # end

        ticket
         
    end    

  end 