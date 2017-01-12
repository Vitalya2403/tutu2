class AddPositionToRailwayStationRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_station_routes, :position, :integer
  end
end
