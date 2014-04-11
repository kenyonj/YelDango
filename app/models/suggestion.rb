class Suggestion < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :event

  validates :restaurant, presence: true
  validates :event, presence: true

  def self.new_suggestion
    events = Event.all
    events.sample
  end
end
