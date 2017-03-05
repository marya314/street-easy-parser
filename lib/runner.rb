require_relative '../config/environment'
require 'pry'

class Runner

        def initialize(top_listings)
            @top_listings = top_listings
        end

        def scrape_data
            #get all sales and rental listings
            response = @top_listings.get_listings
            #get parsed data array of hashes with required information for each listing
            parsed_data = Parser.new
            parsed_response = parsed_data.get_parsed_listings(response)
            #convert data into json; write and open json file
            write_open_json_file(parsed_response)
        end

    private
            #convert parsed data to json and open json file
            def write_open_json_file(parsed_response)
                File.open("listings.json", "w") do |f|
                  f.write(JSON.pretty_generate(parsed_response))
                end
            end
end

#run program
@top_listings = TopListings.new
@runner = Runner.new(@top_listings)
@runner.scrape_data
