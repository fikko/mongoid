module Mongoid #:nodoc:
  class Criteria #:nodoc:

    attr_reader :selector, :options

    # Create the new Criteria object. Does not take any params, just
    # initializes the selector and options hashes that will be 
    # eventually passed to the driver.
    def initialize
      @selector, @options = {}, {}
    end

    # Specify what fields to be returned from the database.
    # Similar to a SQL select field1, field2, field3
    def select(*args)
      @options[:fields] = args.flatten; self
    end

    # The conditions that must prove true on each record in the
    # database in order for them to be a part of the result set.
    # This is a hash that maps to a selector in the driver.
    def where(selector = {})
      @selector = selector; self
    end

    # Specifies how to sort this Criteria. Current valid params
    # are: { :field => 1 } or { :field => -1 }
    def order_by(params = {})
      @options[:sort] = params; self
    end

    # Skips the supplied number of records, as offset behaves in traditional
    # pagination.
    def skip(value = 0)
      @options[:skip] = value; self
    end

  end
end