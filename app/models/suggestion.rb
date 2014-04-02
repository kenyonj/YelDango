class Suggestion < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :event

  def self.new_suggestion
    events = Event.all
    events.sample
  end
end
