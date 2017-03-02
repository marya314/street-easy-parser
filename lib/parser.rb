require 'open-uri'
require 'nokogiri'
require 'json'
require 'pry'

class Parser

    #Build array of hashes for both sales and rentals with required information
    def build_sales_array
    sales_listings = []
        all_sales_listings.each_with_index do |val, info|
            sales_listings <<
            {
                "listing_class" => "sale",
                "address" => val.css('.details-title>a').text.split('#')[0].gsub(/\s+$/,''),
                "unit" => val.css('.details-title>a')[0].text.partition('#').last,
                "url" => "www.streeteasy.com/" + val.css('.details-title>a')[0]['href'],
                "price" => val.css('span.price').text.delete('$ ,').to_i

            }
            #instantiate each listing
            listing = Listing.new(listing)
        end
    end

    def build_rentals_array
    rental_listings = []
        all_rental_listings.each_with_index do |val, info|
            rental_listings <<
            {
                "listing_class" => "rental",
                "address" => val.css('.details-title>a').text.split('#')[0].gsub(/\s+$/,''),
                "unit" => val.css('.details-title>a')[0].text.partition('#').last,
                "url" => "www.streeteasy.com/" + val.css('.details-title>a')[0]['href'],
                "price" => val.css('span.price').text.delete('$ ,').to_i

            }
            #instantiate each listing
            listing = Listing.new(listing)
        end
    end

#convert data to json
    def arrays_to_json
        json_arr = []
        sales_listings.each do |hash|
            json_arr << hash.to_json
        end

        rental_listings.each do |hash|
            json_arr << hash.to_json
        end
    end

    def json_file_open
    #open temporary json file
        File.open("listings.json", "w+") do |f|
          f.write(JSON.pretty_generate(listings.flatten))
        end
    end

end
