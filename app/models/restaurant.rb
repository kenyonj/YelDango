class Restaurant < ActiveRecord::Base
   include Yelp::V1::Review::Request
   has_many :suggestions

   client = Yelp::Client.new

   def get_restaurants(city,state, term='dinner')
      request = Location.new(
                  :city => city,
                  :state => state,
                  :radius => 2,
                  :term => term,
                  :limit => 5
      )
      response = client.search(request)
   end

end
