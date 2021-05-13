class Scraper 

        URL = "https://data.ny.gov/resource/d6yy-54nr.json"
        SITE = "https://www.lotterycritic.com/lottery-winners/the-biggest-lottery-winners-where-are-they-now/"
        NY_LOTTERY = "https://nylottery.ny.gov/how-to-claim"
        
        def get_results
            uri = URI.parse(URL)
            response = Net::HTTP.get_response(uri)
            results = JSON.parse(response.body)
            #binding.pry
            results
        end

        def top_5_largest_jackpots
            @@doc = Nokogiri::HTML(open(SITE))
            puts @@doc.css("div section")[1].text
        end
      
      
        def make_draws
            get_results.each {|draw| Draw.(draw)} 
        end
    end