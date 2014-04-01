class Suggestion < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :event
end
