class HomesController < ApplicationController

  def show
    # get geolocations
    @suggestion = Suggestion.new
  end

end