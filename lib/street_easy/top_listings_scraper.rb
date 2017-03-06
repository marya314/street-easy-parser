
#I was not able to scrape the website due to a 405: Method Not Allowed error. I downloaded the content of the search into two HTML files and uploaded them in spec/fixtures. The following code scrapes data from the HTML files.

class TopListingsScraper

    def get_listings
      all_sales_listings = find_sales_listings
      all_rental_listings = find_rental_listings
      response = all_sales_listings += all_rental_listings
    end

    #open and parse sales html document using nokogiri
    def find_sales_listings
      sales_res = open('fixtures/sales_listings.html').read
      sales_doc = Nokogiri::HTML(sales_res)
      #find all sales entries
      all_sales_listings = sales_doc.css('.details')
      #remove the first two nodes ('featured' listings)
      all_sales_listings.shift
      all_sales_listings.shift
      all_sales_listings
    end

    #open and parse rental html document using nokogiri
    def find_rental_listings
      rental_res = open('fixtures/rental_listings.html').read
      rental_doc = Nokogiri::HTML(rental_res)
      #find all rental entries
      all_rental_listings = rental_doc.css('.details')
      #remove the first two nodes ('featured' listings)
      all_rental_listings.shift
      all_rental_listings.shift
      all_rental_listings
    end

end
