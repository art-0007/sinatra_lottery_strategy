<div class="sidebar">
      <h6>Environment</h6>
      <ul>
        <li><b>Ruby:</b> <%= RUBY_VERSION %></li>
        <li><b>Environment:</b> <%= ENV["RACK_ENV"] %></li>
        <li><b>Server:</b> <%= @env["SERVER_SOFTWARE"] %></li>
        <li><b>Port:</b> <%= @env["SERVER_PORT"] %></li>
      </ul>
    </div>


<div class="content">
      <p> <a href="https://github.com/thebrianemory/corneal">README</a>.</p>
  </div>


  <style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>


'Electronic transmission of data, namely, providing lottery game information, content, predictions, number selection and selection strategies via the Internet, mobile phone and handheld wireless devices
Goods and ServicesProviding a website and online subscription service featuring lottery game facts and information, winning number patterns and strategies, quantitative forecasts of variations of outcomes and lottery number selection
Goods and ServicesProviding temporary use of non-downloadable computer software used in pattern recognition and test simulation for lottery number selection'



.logo {
    -webkit-filter: blur(5px);
    -moz-filter: blur(5px);
    -ms-filter: blur(5px);
    -o-filter: blur(5px);
    filter: blur(5px);
  }


  Draw:

  attr_accessor :draw_date, :winning_numbers, :multiplier
  
    @@all = []

    def new_draws(hash)
         self.new(Time.parse(hash["draw_date"]), hash["winning_numbers"], hash["multiplier"])   
    end

    #.split(" ").map(&:to_i)
  
    def initialize(draw_date, winning_numbers = [], multiplier = nil)
      @draw_date = draw_date
      @winning_numbers = winning_numbers
      @multiplier = multiplier
      @@all << self
    end

    # def self.all
    #     @@all
    # end

    def self.long_standing_numbers
    array = Array(1..69)
    @@all.each do |arr|
        win_num_5 = arr.winning_numbers.first(5)
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

    def self.long_standing_powerball
        array = Array(1..26)
        @@all.each do |arr|
            powerball = arr.winning_numbers.last
                if array.length==1
                break
                else
                array.delete(powerball) 
                end
        end
        array
    end

    def self.find_a_draw_by_date(date)
        a = Time.parse(date)
        right_draw = @@all.detect {|draw| draw.draw_date <= a }   
    end

    def self.check_your_ticket(input)
        ticket = input.split(",")               
        draw = find_a_draw_by_date(ticket.last)
        result_numbers = draw.winning_numbers
        winning_powerball = result_numbers.last
        winning_numbers = result_numbers.first 5
        player_numbers = ticket[0].split(" ").map{|x| x.to_i}
        player_powerball = ticket[1].to_i
        your_matches =  player_numbers&winning_numbers
       if winning_powerball == player_powerball
        puts "You guessed the powerball!".colorize(:light_blue)
       else
        puts "Your powerball doesn't match.".colorize(:light_blue)
       end 
       puts "Your numbers matches: #{your_matches}".colorize(:light_blue)
       puts "____________________________________________________________________________".colorize(:yellow)
       puts "Winning numbers: #{winning_numbers}, powerball: #{winning_powerball} for date: #{draw.draw_date.strftime("%m/%d/%Y")}".colorize(:light_blue)
       puts "____________________________________________________________________________".colorize(:yellow)  
    end

    def self.counted_num
        counts = Hash.new(0)
        @@all.each do |arr|
            arr_1 = arr.winning_numbers.first(5)
            arr_1.each do |num|
                counts[num] +=1
            end
        end  
        counts 
    end

    def self.find_num_by_lucky_days(days)
        arr_1 = []
        arr_2 = []
        days.each do |el|
            lucky_result = find_a_draw_by_date(el)
            result = lucky_result.winning_numbers.first(5)
            arr_1 << result
            arr_2 << lucky_result.winning_numbers.last
        end
        array = []
        array << arr_1.flatten.shuffle.first(5)
        array << arr_2.shuffle.first
        array

    end

    def self.frequently_numbers
        numbers = counted_num.sort_by { |k, v| v }.last(5)
        numbers.reverse    
    end

    def self.rarely_numbers
        numbers = counted_num.sort_by { |k, v| v }.first(5)
        numbers    
    end

    def self.mix_strategy(strategies, lucky_days)
        ticket = []
        counts = Hash.new(0)
        strategies.each {|x| counts[x] += 1}
        #while ticket.flatten.length != 6 do
            n = counts["1"]
            ticket  << rarely_numbers.to_h.keys.shuffle.first(n)
            n = counts["2"]
            ticket  << frequently_numbers.to_h.keys.shuffle.first(n)
            n = counts["3"]
            ticket  << long_standing_numbers.shuffle.first(n)
            if counts["4"] != 0
            n = counts["4"]
            lucky_days_numbers = find_num_by_lucky_days(lucky_days)
            ticket << find_num_by_lucky_days(lucky_days).flatten.first(n)
            end
            #ticket.flatten.uniq
        #end
        ticket.flatten   
    end    
