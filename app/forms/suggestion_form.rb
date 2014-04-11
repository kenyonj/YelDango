class SuggestionForm
  include ActiveModel::Model

  attr_accessor(
      :event_name,
      :event_location,
      :event_time,
      :restaurant_name,
      :restaurant_rating,
      :response
    )

  validates :event_name, presence: true
  validates :event_location, presence: true
  validates :event_time, presence: true
  validates :restaurant_name, presence: true
  validates :restaurant_rating, presence: true
  validates :response, presence: true

  def persist!
    if valid?
      event = Event.create(name: event_name, location: event_location, time: event_time)
      restaurant = Restaurant.create(name: restaurant_name, rating: restaurant_rating)
      Suggestion.create(response: response, restaurant: restaurant, event: event)
    end
  end
end
