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
        # binding.pry
        #get parsed data array of hashes
        @parsed_data = Parser.new
        # binding.pry
        parsed_response = @parsed_data.get_parsed_listings(response)
        json_data = response_to_json(parsed_response)
        binding.pry
        # json_file_open(json_data)
        binding.pry
    end

    #get sales and rental listing data
  #   def get_listing_data
  #       @all_listings = @top_listings.get_listings
  #       # @all_listings
  #       # @all_sales_listings = @top_listings.all_sales_listings
  #       # @all_rental_listings = @top_listings.all_rental_listings
  #       # @all_sales_listings
  #       # @all_rental_listings
  # binding.pry
  #   end

    #get parsed data as a two arrays of hashes containing required info
    # def get_parsed_data(response)
    #      binding.pry
    #     # @parsed_data = Parser.new(all_sales_listings, all_rental_listings)
    #     @parsed_data.get_parsed_listings(response)
    # end

private
    #convert data to json and push into an array
        def response_to_json(parsed_response)
            # binding.pry
            json_arr = []
            parsed_response.each do |hash|
                json_arr << hash.to_json
            end
        end

        # put array of json data into file and open it
        # def json_file_open(json_data)
        #     File.open("listings.json", "w+") do |f|
        #       f.write(JSON.pretty_generate(listings.flatten))
        #     end
        # end
end

#run program
@top_listings = TopListings.new
# binding.pry
@runner = Runner.new(@top_listings)
# @runner.get_listing_data
@runner.scrape_data


# binding.pry
# @runner.get_parsed_data(all_sales_listings, all_rental_listings)
