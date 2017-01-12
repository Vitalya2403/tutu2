class RailwayStation < ActiveRecord::Base
  validates :title, presence: true

  has_many :trains
  has_many :railway_station_routes
  has_many :routes, through: :railway_station_routes

  scope :ordered, ->{ joins(:railway_station_routes).order("railway_station_routes.position").uniq}

  def update_params(route, params)
    railway_station_route = railway_station_route(route)
    railway_station_route.update(params) if railway_station_route
    route.save
  end
  def position_in(route)
    railway_station_route(route).try(:position)
  end

  def update_position(route, position)

    station_route = railway_station_routes.where(route: route).first
    station_route.update(position: position) if station_route
  end

  protected

  def railway_station_route(route)
    @station_route ||= railway_station_routes.where(route: route).first
  end


end
