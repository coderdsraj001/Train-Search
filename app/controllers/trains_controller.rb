class TrainsController < ApplicationController
  before_action :set_train, only: %i[ show edit update destroy ]

  def index
    @trains = Train.all
  end

  def show
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def create
    @train = Train.new(train_params)

    if @train.save
      redirect_to train_path(@train)
      flash[:notice] = "Train was successfully created."
    else
      render 'new'
      flash[:notice] = "There is something wrong."
    end
  end

  def update
    if @train.update(train_params)
      redirect_to train_path(@train)
      flash[:notice] = "Train was successfully updated."
    else
      render 'edit'
      flash[:notice] = "There is something wrong."
    end
  end

  def destroy
    if @train.destroy
      redirect_to trains_path
      flash[:notice] = "Train was successfully destroyed."
    end
  end

  private
    def set_train
      @train = Train.find(params[:id])
    end

    def train_params
      params.require(:train).permit(:name)
    end
end
