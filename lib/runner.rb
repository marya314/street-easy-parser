require_relative '../config/environment'
require 'pry'

class Runner

    attr_reader :top_listings

    def initialize(top_listings)
        @top_listings = top_listings
    end

    #get sales and rental listing data
    def get_listing_data
        @top_listings.get_listings
        binding.pry
    end

    #get parsed data as an array of hashes

    def get_parsed_data
        @top_listings.get_parsed_listings
    end

### @top_listings.all_sales_listings is sales array
### @top_listings.all_rental_listings is rental array

    #convert data to json and push into an array
        def arrays_to_json
            json_arr = []
            sales_listings.each do |hash|
                json_arr << hash.to_json
            end

            rental_listings.each do |hash|
                json_arr << hash.to_json
            end
        end

        #put array of json data into file and open it
        # def json_file_open
        #     File.open("listings.json", "w+") do |f|
        #       f.write(JSON.pretty_generate(listings.flatten))
        #     end
        # end


end

#run program
@top_listings = TopListings.new
# binding.pry
@runner = Runner.new(@top_listings)
@runner.get_listing_data
@runner.get_parsed_data
