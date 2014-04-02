class SuggestionsController < ApplicationController

  def create
    @suggestion = Suggestion.new
    
  end

end