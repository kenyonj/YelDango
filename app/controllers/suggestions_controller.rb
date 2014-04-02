class SuggestionsController < ApplicationController

  def new
    @city = session[:city]
    @state = session[:state]
    events = Event.new
    events.get_events(@city, @state)
    restaurants = Restaurant.get_restaurants(@city, @state)
    @suggestion = Suggestion.new_suggestion(events, restaurants)
  end

end
