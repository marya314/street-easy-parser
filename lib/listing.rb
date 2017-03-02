class Listing

    attr_accessor :listing_class, :address, :unit, :url, :price

    @@count = 0
    @@instances = []

    #assigns Nokogiri nodes to appropriate variables when each object is initialized
        def initialize(listing)
            @listing_class
            @address
            @unit = unit
            @url = url
            @price = price
            @@count += 1
            @@instances << self
        end

        def self.all
            @@instances.inspect
        end

        def self.count
            @@count
        end

end
