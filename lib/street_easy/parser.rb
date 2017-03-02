class Parser

    attr_reader :all_sales_listings, :all_rental_listings

    def initialize(all_sales_listings, all_rental_listings)
        @all_sales_listings = all_sales_listings
        @all_rental_listings = all_rental_listings
    end

    #get parsed listing data
    def get_parsed_listings
        @sales_scrape_results = build_sales_array
        @rental_scrape_results = build_rentals_array
    end

    #Build array of hashes for both sales and rentals with required information
    def build_sales_array(all_sales_listings)
    @sales_listings = []
        @all_sales_listings.each_with_index do |val, info|
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

    def build_rentals_array(all_rental_listings)
    @rental_listings = []
        @all_rental_listings.each_with_index do |val, info|
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



end
