class ChangeEventNames < ActiveRecord::Migration
  def change
    rename_column :events, :event_name, :name
    rename_column :events, :event_time, :time
    rename_column :events, :event_location, :location
  end
end
