class CreateHourlyForecasts < ActiveRecord::Migration
  def change
    create_table :hourly_forecasts do |t|
      t.references :city, index: true
      t.datetime :datetime
      t.decimal :temperature
      t.decimal :precip_probability

      t.timestamps null: false
    end
    add_foreign_key :hourly_forecasts, :cities
  end
end
