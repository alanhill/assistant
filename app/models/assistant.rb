class Assistant < ApplicationRecord
  include Weather

  def weather
    apikey = ENV['WEATHER_API_KEY']
    response = Net::HTTP.get_response(URI.parse("http://api.openweathermap.org/data/2.5/weather?id=6094817&units=metric,
on&APPID=#{apikey}"))
    message = translate_response(response.body)

    message
  end
end
