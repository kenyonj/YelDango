class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_name, :string
    add_column :events, :event_time, :string
    add_column :events, :event_location, :string
  end
end
