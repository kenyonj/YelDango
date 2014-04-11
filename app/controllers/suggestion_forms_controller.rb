class SuggestionFormsController < ApplicationController
  def create
    suggestion_form = SuggestionForm.new(suggestion_form_params)
    suggestion_form.persist!
    redirect_to root_path
  end

  private
  def suggestion_form_params
    params.require(:suggestion_form).permit(
      :event_name,
      :event_location,
      :event_time,
      :restaurant_name,
      :restaurant_rating,
      :response
    )
  end
end