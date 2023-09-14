class CurrentWeatherService
  attr_reader :latitude, :longitude, :location_name

  def initialize(latitude, longitude, location_name)
    @url = "https://api.open-meteo.com/v1/forecast"
    @latitude = latitude
    @longitude = longitude
    @location_name = location_name
  end

  def call
    response = Net::HTTP.get_response(uri)
    data = JSON.parse(response.body)
    save_location(data) if data['latitude'] && data['longitude']
    data
  end

  private

  def uri
    params = {
     latitude: latitude,
     longitude: longitude,
     current_weather: true,
     timezone: 'auto',
     daily: 'precipitation_probability_max'
   }
   URI("#{@url}?#{URI.encode_www_form(params)}")
  end

  def save_location(data)
    Location.find_or_create_by(name: location_name.to_s.titleize) do |location|
      location.latitude = data['latitude']
      location.longitude = data['longitude']
      location.weather_code = data['current_weather']['weathercode']
      location.weather_temperature = data['current_weather']['temperature']
      location.daily_precipitation_max = data['daily']['precipitation_probability_max'][0]
    end
  end
end