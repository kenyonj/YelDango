class SuggestionsController < ApplicationController

  def new
    city = session[:city]
    state = session[:state]
    Event.get_events(city, state)
    # Restaurant.get_restaurants(@city, @state)
    @suggestion = Suggestion.new_suggestion
    render :show
  end

  def show
  end

end
