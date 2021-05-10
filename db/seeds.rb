# landmarks_list = {
#     "Madison Square Guarden" => {
#       :year_completed => 1901
#     },
#     "The big bull outside" => {
#       :year_completed => 1995
#     },
#     "Flatiron School" => {
#       :year_completed => 2014
#     },
#     "Museum Mile" => {
#       :year_completed => 1058
#     },
#     "Subway Station" => {
#       :year_completed => 2015
#     },
#     "Cast Iron" => {
#       :year_completed => 1951
#     },
#     "Shea Stadium" => {
#       :year_completed => 1964
#     },
#     "Flatiron Building" => {
#       :year_completed => 1902
#     },
#     "Brooklyn Bridge" => {
#       :year_completed => 1883
#     }
#   }

# landmarks_list.each do |name, landmark_hash|
#   p = Landmark.new
#   p.name = name
#   landmark_hash.each do |attribute, value|
#       p[attribute] = value
#   end
#   p.save
# end

# figure_list = {
#     "Billy The Kid" => {
#     },
#     "Mark Zuckerberg" => {
#     },
#     "Ada Lovelace" => {
#     },
#     "Linus Torvalds" => { 
#     }
#   }

# figure_list.each do |name, figure_hash|
#   p = Figure.new
#   p.name = name
#   p.save
# end


# title_list = {
#     "The Mayor" => {
#     },
#     "The Don" => {
#     },
#     "Mr. President" => {
#     }
#   }

# title_list.each do |name, figure_hash|
#   p = Title.new
#   p.name = name
#   p.save
# end


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
            arr = draw.winning_numbers.split(" ").first(5)
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
           @number.save
        end

        

        # def add_data (draw)
        #         hash = Hash.new
        #         (1..69).each do |num|
        #             b = "num_#{num}"
        #             if draw.include?(num)
        #             hash[b]=1
        #             else
        #             hash[b] = 0
        #             end
        #         end
        #         hash
        #     end