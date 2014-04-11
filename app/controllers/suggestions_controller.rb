class SuggestionsController < ApplicationController

  def new
    @suggestion_forms = some_method_that_is_named_better_than_this
  end

  def update
    suggestion = find_suggestion
    suggestion.update(response_params)
    if suggestion.response
      redirect_to suggestion_path
    else
      redirect_to new_suggestion_path
    end
  end

  private
  def response_params
    params.require(:suggestion).permit(:response)
  end

  def find_suggestion
    Suggestion.find(params[:id])
  end

  def some_method_that_is_named_better_than_this
    city = session[:city]
    state = session[:state]
    events = Event.get_events(city, state)
    restaurants = Restaurant.get_restaurants(city, state)
    10.times.map { |num| @suggestion_forms << SuggestionForm.new(event: events.sample, restaurant: restaurants.sample, id: num) }
  end
end
