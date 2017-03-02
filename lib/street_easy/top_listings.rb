
#I was not able to scrape the website due to a 405: Method Not Allowed error. I downloaded the content of the search into two HTML files and uploaded them in spec/fixtures. The following code scrapes data from the HTML files.

class TopListings
# binding.pry

    attr_reader :all_sales_listings, :all_rental_listings

    def initialize
        @all_sales_listings = all_sales_listings
        @all_rental_listings = all_rental_listings
    end

    def get_listings
        sales_doc = find_sales_listings
        @all_sales_listings = parse_sales_listings(sales_doc)
        rental_doc = find_rental_listings
        @all_rental_listings = parse_rental_listings(rental_doc)
        # @all_sales_listings
        # @all_rental_listings
        #  binding.pry
    end

    #open and parse document using nokogiri to find sales listings
    def find_sales_listings
        # binding.pry
        sales_res = open('spec/fixtures/sales_listings.html').read
        # binding.pry
        sales_doc = Nokogiri::HTML(sales_res)
        sales_doc
        # binding.pry
    end

    #find all qualifying sales listings on the page
    def parse_sales_listings(sales_doc)
        all_sales_listings = sales_doc.css('.details')
        #remove the first two nodes ('featured' listings)
        all_sales_listings.shift
        all_sales_listings.shift
        all_sales_listings
    end

    #open and parse document using nokogiri to find rental listings
    def find_rental_listings
        rental_res = open('spec/fixtures/rental_listings.html').read
        rental_doc = Nokogiri::HTML(rental_res)
        rental_doc
        # binding.pry
    end

    #find all qualifying rental listings on the page
    def parse_rental_listings(rental_doc)
        all_rental_listings = rental_doc.css('.details')
        #remove the first two nodes ('featured' listings)
        all_rental_listings.shift
        all_rental_listings.shift
        all_rental_listings
    end

end

# get_listings
# binding.pry
