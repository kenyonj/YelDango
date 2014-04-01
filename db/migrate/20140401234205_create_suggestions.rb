class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.belongs_to :restaurant, index: true
      t.belongs_to :event, index: true
      t.boolean :response

      t.timestamps
    end
  end
end
