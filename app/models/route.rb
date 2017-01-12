class Route < ActiveRecord::Base
  has_many :railway_station_routes
  has_many :railway_stations, through: :railway_station_routes

  validates :name, presence: true
  validate :stations_count

  before_validation :set_name

  def start_station
    railway_stations.first
  end

  def end_station
    railway_stations.last
  end

  private

  def set_name

    self.name = "#{start_station.title} - #{end_station.title}" if railway_stations?

  end

  def railway_stations?
    railway_stations.size >= 2
  end

  def stations_count
    errors.add(:base, "routes.shod_contain") unless railway_stations?
  end


end
