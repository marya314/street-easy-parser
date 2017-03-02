class TopListings

    #I was not able to scrape the website due to a 405: Method Not Allowed error. I downloaded the content of the search into two HTML files and uploaded them in spec/fixtures. The following code scrapes data from the HTML files.

    def find_sales_listings
        binding.pry
        res = open('../spec/fixtures/sales_listings.html').read
        doc = Nokogiri::HTML(res)
        # binding.pry
    end

    #find all listing entries on the page
    def parse_sales_listings
        all_sales_listings = doc.css('.details')
        #remove the first two nodes ('featured' listings)
        all_sales_listings.shift
        all_sales_listings.shift
    end

    def find_rental_listings
        res = open('../spec/fixtures/rental_listings.html').read
        doc = Nokogiri::HTML(res)
        # binding.pry
    end

    #find all listing entries on the page
    def parse_rental_listings
        all_rental_listings = doc.css('.details')
        #remove the first two nodes ('featured' listings)
        all_rental_listings.shift
        all_rental_listings.shift
    end

end
