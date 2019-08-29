class AreasController < ApplicationController
  before_action :set_area, only: [:show, :edit, :update, :destroy]


  def index
    @areas = policy_scope(Area).all
  end

  def show
  end

  def new
    @area = Area.new
    authorize @area
  end

  def create
    @area = Area.new(area_params)
    authorize @area
    if @area.save
      redirect_to area_path(@area)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @area.update(area_params)
      redirect_to area_path(@area)
    else
      render :edit
    end
  end

  def destroy
    if @area.destroy
      redirect_to areas_path
    else
      render :edit
    end
  end

  private

  def set_area
    @area = Area.find(params[:id])
    authorize @area
  end

  def area_params
    params.require(:area).permit(:area_name, :area_name_katakana, :area_name_alphabet, :region, :prefecture, :latitude, :longitude)
  end
end
