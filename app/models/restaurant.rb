class Restaurant < ActiveRecord::Base
   include Yelp::V1::Review::Request
   has_many :suggestions

   validates :name, presence: true, uniqueness: true
   validates :rating, presence: true

   def self.get_restaurants(city,state, term='dinner')
     # result = []
     # 10.times { |num| result << new(name: "RESTAURANT#{num}", rating: 4.0 ) }
     # result
     yelp_profiles = yelp_request(city, state, term='dinner')
     parse_yelp_profiles(yelp_profiles)
   end
  
  def self.yelp_request(city,state,term='dinner')
    client = Yelp::Client.new
     request = Location.new(
       :compress_response => false,
                 :city => city,
                 :state => state,
                 :radius => 2,
                 :term => term,
                 :limit => 15
     )
     response = client.search(request)
  end

  def self.parse_yelp_profiles(yelp_profiles)
    businesses = yelp_profiles["businesses"]
    restaurants = []
    businesses.each do |business|
      rest = Restaurant.new(name: business["name"], rating: business["avg_rating"])
      restaurants << rest
    end
    restaurants
  end
end
