class StationsController < ApplicationController
  before_action :authorize_admin, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_station, only: %i[ show edit update destroy ]

  def index
    if params[:search]
      @stations = Station.search(params[:search])
    else
      @stations = Station.all
    end
  end

  def show
    @station = Station.find(params[:id])
    @response = TrainTimePresenter.new(@station)
  end

  def new
    @station = Station.new
  end

  def edit
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      redirect_to station_path(@station)
      flash[:notice] = "Train was successfully created."
    else
      render 'new'
      flash[:notice] = "There is something wrong."
    end
  end

  def update
    if @station.update(station_params)
      redirect_to station_path(@station)
      flash[:notice] = "Station was successfully updated." 
    else
      render 'edit'
      flash[:notice] = "There is something wrong."
    end
  end

  def destroy
    @station.destroy
    redirect_to stations_path
    flash[:notice] = "Station was successfully destroyed."
  end

  private

    def set_station
      @station = Station.find(params[:id])
    end

    def station_params
      params.require(:station).permit(:name)
    end
end
