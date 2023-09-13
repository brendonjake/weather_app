module ApplicationHelper
  def weather_description(code)
    case code
    when 0
      'Clear sky'
    when 1, 2, 3
      'Mainly clear, partly cloudy, and overcast'
    when 45, 48
      'Fog and depositing rime fog'
    when 51, 53, 55
      'Drizzle: Light, moderate, and dense intensity'
    when 56, 57
      'Freezing Drizzle: Light and dense intensity'
    when 61, 63, 65
      'Rain: Slight, moderate and heavy intensity'
    when 66, 67
      'Freezing Rain: Light and heavy intensity'
    when 71, 73, 75
      'Snow fall: Slight, moderate, and heavy intensity'
    when 77
      'Snow grains'
    when 80, 81, 82
      'Rain showers: Slight, moderate, and violent'
    when 85, 86
      'Snow showers slight and heavy'
    when 95
      'Thunderstorm: Slight or moderate'
    when 96, 99
      'Thunderstorm with slight and heavy hail'
    else
      'Unknown weather code'
    end
  end
end
