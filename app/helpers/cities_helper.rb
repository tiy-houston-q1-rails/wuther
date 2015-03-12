module CitiesHelper

  def night_time?(date_time)

    nighttime_hours = [0,1,2,3,4,5,20,21,22,23]
    nighttime_hours.include? date_time.hour

  end
end
