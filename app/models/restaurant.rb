class Restaurant < ActiveRecord::Base
   include Yelp::V1::Review::Request
   has_many :suggestions


   def get_restaurants(city,state, term='dinner')
     yelp_profiles = yelp_request(city, state, term='dinner')
     restaurants = parse_yelp_profiles(yelp_profiles)
     restaurants.sample
   end
  
  def yelp_request(city,state,term='dinner')
    client = Yelp::Client.new
     request = Location.new(
       :compress_response => false,
                 :city => city,
                 :state => state,
                 :radius => 2,
                 :term => term,
                 :limit => 5
     )
     response = client.search(request)
  end

  def parse_yelp_profiles(yelp_profiles)
    businesses = yelp_profiles["businesses"]
    restaurants = []
    businesses.each do |business|
      rest = Restaurant.new(business["name"])
      restaurants << rest
    end
    restaurants
  end
end
