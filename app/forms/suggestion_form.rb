class SuggestionForm
  include ActiveModel::Model

  attr_accessor(
    :event,
    :restaurant,
    :event_name,
    :event_location,
    :event_time,
    :restaurant_name,
    :restaurant_rating,
    :response,
    :id
  )

  def persist!
    event = Event.create(name: event_name, time: event_time, location: event_location)
    restaurant = Restaurant.create(name: restaurant_name, rating: restaurant_rating)
    Suggestion.create(response: response, restaurant: restaurant, event: event)
  end
end
