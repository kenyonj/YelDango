class Event < ActiveRecord::Base

  def get_events(city, state)
    movieShowTimes = GoogleMovies47::Crawler.new(
      city: city,
      state: state
    )
    theater = movieShowTimes.theaters[0]
    theater[:movies].each do |movie_info|
      movie_info[:times].each do |movie_time|
        if movie_time[0] == "6" || movie_time[0] == "7" || movie_time[0] == "8"
          Event.create(event_location: theater[:name],
                       event_name: movie_info[:name],
                       event_time: movie_time
                      )
        end
      end
    end
  end

end
