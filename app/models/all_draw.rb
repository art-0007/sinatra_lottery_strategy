class All_draw < ActiveRecord::Base
    URL = "https://data.ny.gov/resource/d6yy-54nr.json"

    def get_results
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        results = JSON.parse(response.body)
        #binding.pry
        results
    end
end