class StationsController < ApplicationController
  before_action :set_station, only: %i[ show edit update destroy ]

  def index
    if params[:search]
      @stations = Station.search(params[:search])
    else
      @stations = Station.all
    end
  end

  def show
    @trains = @station.trains
  end

  def new
    @station = Station.new
  end

  def edit
  end

  def create
    @station = Station.new(station_params)
    respond_to do |format|
      if @station.save
        format.html { redirect_to station_url(@station), notice: "Station was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to station_url(@station), notice: "Station was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @station.destroy

    respond_to do |format|
      format.html { redirect_to stations_url, notice: "Station was successfully destroyed." }
    end
  end

  private

    def set_station
      @station = Station.find(params[:id])
    end

    def station_params
      params.require(:station).permit(:name)
    end
end
