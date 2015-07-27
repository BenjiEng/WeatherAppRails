class TemperaturesController < ApplicationController
  require 'area'
  require 'open_weather'

  def show
    @zip = params[:zip]
    @city = @zip.to_region

    #from open weather
    temp_payload = OpenWeather::Current.city(@city, units: "imperial")
    @name = temp_payload['name']
    @faren = temp_payload['main']['temp']
    @cels = (((@faren-32) * 5)/9).round(2)

    #from wunerground
    w_api = Wunderground.new("1aa6d90f5543a8cc")
    wunder = w_api.conditions_for("#{@zip}")['current_observation']
    @faren_w = wunder['temp_f']
    @cels_w = wunder['temp_c']
    @name_w = wunder['display_location']['full']
    render :root
  end
end
