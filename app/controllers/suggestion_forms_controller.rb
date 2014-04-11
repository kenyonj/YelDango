class SuggestionFormsController < ApplicationController
  def create
    suggestion_form = SuggestionForm.new(suggestion_form_params)
    @suggestion_form_id = params[:suggestion_form][:id]
    suggestion_form.persist!
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
