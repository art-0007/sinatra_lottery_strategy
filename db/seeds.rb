


URL = "https://data.ny.gov/resource/d6yy-54nr.json"

    
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        results = JSON.parse(response.body)
        results.each do |d| 
         @draw = Draw.new(d)
         @draw.save
        end

        @draws = Draw.all
        @draws.each do |draw|
            arr = draw.winning_numbers.split(" ").map(&:to_i).first(5)
            hash = Hash.new
            (1..69).each do |num|
                b = "num_#{num}"
                if arr.include?(num)
                hash[b]=1
                else
                hash[b] = 0
                end
            end
           @number = Number.new(hash)
           @number.draw_date = draw.draw_date
           @number.save
        end

        

