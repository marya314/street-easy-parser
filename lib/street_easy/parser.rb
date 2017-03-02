# require 'open-uri'
# require 'nokogiri'
# require 'json'
# require 'pry'
#
# #####################can be toplistings class##################
# #############ends up with all_sales_listings and all_rental_listings##########
#
# class TopListings
# # binding.pry
#     def initialize
#         @all_sales_listings = all_sales_listings
#         @all_rental_listings = all_rental_listings
#     end
#
#     def get_listings
#         sales_doc = find_sales_listings
#         @all_sales_listings = parse_sales_listings(sales_doc)
#         rental_doc = find_rental_listings
#         @all_rental_listings = parse_rental_listings(rental_doc)
#         # @all_sales_listings
#         # @all_rental_listings
#          binding.pry
#     end
#
#     #open and parse document using nokogiri to find sales listings
#     def find_sales_listings
#         # binding.pry
#         sales_res = open('spec/fixtures/sales_listings.html').read
#         # binding.pry
#         sales_doc = Nokogiri::HTML(sales_res)
#         sales_doc
#         # binding.pry
#     end
#
#     #find all qualifying sales listings on the page
#     def parse_sales_listings(sales_doc)
#         all_sales_listings = sales_doc.css('.details')
#         #remove the first two nodes ('featured' listings)
#         all_sales_listings.shift
#         all_sales_listings.shift
#         all_sales_listings
#     end
#
#     #open and parse document using nokogiri to find rental listings
#     def find_rental_listings
#         rental_res = open('spec/fixtures/rental_listings.html').read
#         rental_doc = Nokogiri::HTML(rental_res)
#         rental_doc
#         # binding.pry
#     end
#
#     #find all qualifying rental listings on the page
#     def parse_rental_listings(rental_doc)
#         all_rental_listings = rental_doc.css('.details')
#         #remove the first two nodes ('featured' listings)
#         all_rental_listings.shift
#         all_rental_listings.shift
#         all_rental_listings
#     end
#     get_listings
# end
#
#
# binding.pry
####################

class Parser

    attr_reader :all_sales_listings, :all_rental_listings, :sales_scrape_results, :rental_scrape_results

    # def initialize(all_sales_listings, all_rental_listings)
    #     @all_sales_listings = all_sales_listings
    #     @all_rental_listings = all_rental_listings
    # end

    #run methods in Parser class
    def get_parsed_listings(all_sales_listings, all_rental_listings)
        binding.pry
        @sales_scrape_results = build_sales_array(all_sales_listings)
        @rental_scrape_results = build_rentals_array(all_rental_listings)
    end

    # def get_listings
    #     @all_sales_listings = find_sales_listings
    #     @all_rental_listings = find_rental_listings
    #     #binding.pry
    # end


    # Build array of hashes for sales with required information
    def build_sales_array(all_sales_listings)
    sales_listings = []
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
        sales_listings
    end

    # Build array of hashes for both rentals with required information
    def build_rentals_array(all_rental_listings)
    rental_listings = []
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
        rental_listings
    end

end



# class Parser
#
#     attr_reader :all_sales_listings, :all_rental_listings
#
#     def initialize(all_sales_listings, all_rental_listings)
#         @all_sales_listings = all_sales_listings
#         @all_rental_listings = all_rental_listings
#     end
#
#     #get parsed listing data
#     def get_parsed_listings
#         sales_scrape_results = build_sales_array
#         rental_scrape_results = build_rentals_array
#     end
#
#     #Build array of hashes for both sales and rentals with required information
#     def build_sales_array(all_sales_listings)
#     sales_listings = []
#         @all_sales_listings.each_with_index do |val, info|
#             sales_listings <<
#             {
#                 "listing_class" => "sale",
#                 "address" => val.css('.details-title>a').text.split('#')[0].gsub(/\s+$/,''),
#                 "unit" => val.css('.details-title>a')[0].text.partition('#').last,
#                 "url" => "www.streeteasy.com/" + val.css('.details-title>a')[0]['href'],
#                 "price" => val.css('span.price').text.delete('$ ,').to_i
#
#             }
#             #instantiate each listing
#             listing = Listing.new(listing)
#         end
#         sales_listings
#     end
#
#     def build_rentals_array(all_rental_listings)
#     rental_listings = []
#         @all_rental_listings.each_with_index do |val, info|
#             rental_listings <<
#             {
#                 "listing_class" => "rental",
#                 "address" => val.css('.details-title>a').text.split('#')[0].gsub(/\s+$/,''),
#                 "unit" => val.css('.details-title>a')[0].text.partition('#').last,
#                 "url" => "www.streeteasy.com/" + val.css('.details-title>a')[0]['href'],
#                 "price" => val.css('span.price').text.delete('$ ,').to_i
#
#             }
#             #instantiate each listing
#             listing = Listing.new(listing)
#         end
#         rental_listings
#     end
#
#
#
# end
