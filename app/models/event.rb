class Event < ActiveRecord::Base

  # validates :event_name, uniqueness: { scope: [:event_location, :event_time] }

  def self.get_events(city, state)
    events = []
    movieShowTimes = GoogleMovies47::Crawler.new(
      city: city,
      state: state
    )
    movieShowTimes.theaters.each do |theater|
      theater[1][:movies].each do |movie_info|
        movie_info[:times].each do |movie_time|
          if movie_time[0] == "6" || movie_time[0] == "7" || movie_time[0] == "8"
            events << Event.new(
              location: theater[1][:name],
              name: movie_info[:name],
              time: movie_time
            )
          end
        end
      end
    end
    events
  end

end
