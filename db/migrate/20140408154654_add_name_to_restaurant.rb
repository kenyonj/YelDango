class AddNameToRestaurant < ActiveRecord::Migration
  def change
    change_table :restaurants do |t|
      t.string :name
      t.decimal :rating, precision: 2, scale: 1
    end
  end
end
