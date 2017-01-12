class StationsRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :railway_station_routes do |t|
      t.integer :railway_station_id
      t.integer :route_id
    end
  end
end
