class TemperaturesController < ApplicationController
  require 'area'

  def show
    @zip = params[:zip]
    @city = @zip.to_region
    @lat = params[:zip].to_lat
    @lon = params[:zip].to_lon
    
    #from wunderground
    w_api = Wunderground.new("1aa6d90f5543a8cc")
    wunder = w_api.conditions_for("#{@zip}")['current_observation']
    @faren_w = wunder['temp_f']
    @cels_w = wunder['temp_c']
    @name_w = wunder['display_location']['full']
    render :root
  end
end
