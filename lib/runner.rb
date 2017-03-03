require_relative '../config/environment'
require 'pry'

class Runner

    attr_reader :top_listings, :all_listings, :parsed_data

    def initialize(top_listings)
        @top_listings = top_listings
        @all_listings
    end

    def scrape_data
        #get all sales and rental listings
        response = @top_listings.get_listings
        #get parsed data array of hashes
        @parsed_data = Parser.new
        parsed_response = @parsed_data.get_parsed_listings(response)
        json_data = response_to_json(parsed_response)
        json_file_open(json_data)
    end

private
    #convert data to json and push into an array
        def response_to_json(parsed_response)
            json_arr = []
            parsed_response.each do |hash|
                json_arr << hash.to_json
            end
        end

        #put array of json data into file and open it
        def json_file_open(json_data)
            File.open("listings.json", "w") do |f|
              f.write(JSON.pretty_generate(json_data.flatten))
            end
        end
end

#run program
@top_listings = TopListings.new
@runner = Runner.new(@top_listings)
@runner.scrape_data
