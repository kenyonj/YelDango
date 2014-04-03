Yelp.configure(:yws_id          => ENV.fetch('YELP_API_TOKEN'),
               :consumer_key    => ENV.fetch('YELP_CONSUMER_KEY'),
               :consumer_secret => ENV.fetch('YELP_CONSUMER_SECRET'),
               :token           => ENV.fetch('YELP_TOKEN'),
               :token_secret    => ENV.fetch('YELP_TOKEN_SECRET'))

