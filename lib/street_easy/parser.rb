class Parser

    def get_parsed_listings(listings)
        parsed_listings = build_listing_array(listings)
    end

    # Parse data for required information and build an array of hashes
     def build_listing_array(all_listings)
         parsed_listings_array = []
         all_listings.each do |val, info|
            parsed_listings_array <<
            {
                "listing_class" => val.css('div.details-title a')[0]['data-gtm-listing-type'],
                "address" => val.css('.details-title>a').text.split('#')[0].gsub(/\s+$/,''),
                "unit" => val.css('.details-title>a')[0].text.partition('#').last,
                "url" => "www.streeteasy.com/" + val.css('.details-title>a')[0]['href'],
                "price" => val.css('span.price').text.delete('$ ,').to_i
            }
            #instantiate each listing
        listing = Listing.new(listing)
        end
        parsed_listings_array
    end
end
