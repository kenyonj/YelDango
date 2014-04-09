class SuggestionsController < ApplicationController

  def new
    city = session[:city]
    state = session[:state]
    @events = Event.get_events(city, state)
    @restaurants = Restaurant.get_restaurants(city, state)
    @suggestion = Suggestion.new
    ajsdflasdf.asdf
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
end
