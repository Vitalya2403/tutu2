class Admin::RailwayStationsController < Admin::BaseController

  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position]

  # GET /railway_stations
  # GET /railway_stations.json
  def index
    @railway_stations = RailwayStation.all
  end

  # GET /railway_stations/1
  # GET /railway_stations/1.json
  def show
  end

  # GET /railway_stations/new
  def new
    @railway_station = RailwayStation.new
  end

  # GET /railway_stations/1/edit
  def edit
  end

  # POST /railway_stations
  # POST /railway_stations.json
  def create
    @railway_station = RailwayStation.new(railway_station_params)

    if @railway_station.save
      redirect_to [:admin, @railway_station], notice: I18n.t('notices.railway_station_created')
    else
      render 'new'
    end
  end

  # PATCH/PUT /railway_stations/1
  # PATCH/PUT /railway_stations/1.json
  def update
    respond_to do |format|
      if @railway_station.update(railway_station_params)
        format.html { redirect_to [:admin, @railway_station], notice: 'Railway station was successfully updated.' }
     else
        format.html { render :edit }
      end
    end
  end

  # DELETE /railway_stations/1
  # DELETE /railway_stations/1.json
  def destroy
    @railway_station.destroy
    redirect_to admin_railway_stations_path, notice: I18n.t('notices.railway_station_destroyed')
  end

  def update_position
    @route = Route.find(params[:route_id])
    @railway_station.update_position(@route, params[:position])
    redirect_to [:admin, @route]
  end

  def update_params
    @route = Route.find(params[:route_id])
    @railway_station.update_params(@route, {
        position: params[:position]
    })
    redirect_to [:admin, @route], notice: I18n.t('notices.params_updated')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def railway_station_params
      params.require(:railway_station).permit(:title)
    end
end
