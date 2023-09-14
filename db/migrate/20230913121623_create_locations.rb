class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :latitude
      t.string :longitude
      t.integer :weather_code
      t.decimal :weather_temperature
      t.integer :daily_precipitation_max
      t.timestamps
    end
  end
end
