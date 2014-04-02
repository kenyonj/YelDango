class GuestsController < ApplicationController
  def create
    session[:city] = params[:user_location][:city]
    session[:state]= params[:user_location][:state]
    redirect_to new_suggestion_path
  end
end
