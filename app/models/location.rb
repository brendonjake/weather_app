class Location < ApplicationRecord
  validates :name, uniqueness: true
  validates :longitude, :latitude, :weather_code, :weather_temperature,
            :daily_precipitation_max, presence: true
end