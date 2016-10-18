module Weather
  extend ActiveSupport::Concern

  def translate_response(body)
    body = JSON.parse(body)

    @message = []
    @message << translate_weather_response(body['weather']).to_s
    @message << translate_temperature_response(body['main']).to_s
    @message << translate_sunrise_sunset_response(body['sys']).to_s

    @message = "Here's today's weather:\n#{@message[0]}\n#{@message[1]}\n#{@message[2]}"
  end

  def translate_weather_response(weather)
    weather.each do |w|
      @weather = "#{w['main']} - #{w['description']}"
    end

   @weather
  end

  def translate_temperature_response(temperature)
    "Them temp is #{temperature['temp']} degrees celcius."
  end

  def translate_sunrise_sunset_response(times_of_day)
    sunrise = Time.at(times_of_day['sunrise'])
    sunset = Time.at(times_of_day['sunset'])

    "Sunrise is at #{sunrise.hour}:#{sunrise.min}:#{sunrise.sec}, sunset is at #{sunset.hour}:#{sunset.min}:#{sunset.sec}"
  end
end
