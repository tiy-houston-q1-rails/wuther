namespace :wuther do

  desc "Get current forecasts for all cities in db"
  task :forecasts => :environment do

    require 'json'
    require 'http'
    require 'geocoder'
    require 'pry'

    api_key = ENV["FORECASTIO_API_KEY"]

    City.all.each do |city|

      text = Http.get("https://api.forecast.io/forecast/#{api_key}/#{city.lat},#{city.lng}")
      data = JSON.parse(text)
      data["hourly"]["data"].each do |node|

        forecast = HourlyForecast
                    .where(city_id: city.id)
                    .where(datetime: Time.at(node["time"]))
                    .first_or_create #http://apidock.com/rails/ActiveRecord/Relation/first_or_create
        forecast.temperature = node["temperature"]
        forecast.precip_probability = node["precipProbability"]
        forecast.save
      end

    end


  end

end
