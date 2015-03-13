class HourlyForecast < ActiveRecord::Base
  belongs_to :city

  scope :future, -> { where("datetime >=?", Time.now).order("datetime ASC")}
end
