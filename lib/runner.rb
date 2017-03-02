require_relative '../config/environment'
require 'pry'

class Runner

    attr_reader :top_listings, :all_listings, :parsed_data

    def initialize(top_listings)
        @top_listings = top_listings
        @all_listings
    end

    def scrape_data
        # binding.pry
        @response = get_listing_data
        binding.pry
        parsed_data = get_parsed_data
    end

    #get sales and rental listing data
    def get_listing_data
        @all_listings = @top_listings.get_listings
        @all_listings
        # @all_sales_listings = @top_listings.all_sales_listings
        # @all_rental_listings = @top_listings.all_rental_listings
        # @all_sales_listings
        # @all_rental_listings
  binding.pry
    end

    #get parsed data as a two arrays of hashes containing required info
    def get_parsed_data(all_sales_listings, all_rental_listings)
         binding.pry
        # @parsed_data = Parser.new(all_sales_listings, all_rental_listings)
        @parsed_data.get_parsed_listings(all_sales_listings, all_rental_listings)
    end

private
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
# @runner.get_listing_data
@runner.scrape_data
# @parsed_data = Parser.new(all_sales_listings, all_rental_listings)

# binding.pry
# @runner.get_parsed_data(all_sales_listings, all_rental_listings)
