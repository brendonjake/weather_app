class LocationsController < ApplicationController
  include ApplicationHelper
  def index
    @locations = Location.all
  end

  def fetch_weather
    CurrentWeatherService.new(params[:latitude], params[:longitude], params[:location_name]).call
    flash[:notice] = 'Successfully Fetch'
    redirect_to locations_path
  end
end
