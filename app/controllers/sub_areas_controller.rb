class SubAreasController < ApplicationController
  before_action :set_sub_area, only: [:show, :edit, :update, :destroy]

  def show
    @area = @sub_area.area
  end

  def new
    @area = Area.find(params[:area_id])
    @sub_area = SubArea.new
    authorize @sub_area
  end

  def create
    @area = Area.find(params[:area_id])
    @sub_area = SubArea.new(sub_area_params)
    authorize @sub_area
    @sub_area.area = @area
    if @sub_area.save
      redirect_to area_path(@area)
    else
      render :new
    end
  end

  private

  def set_sub_area
    @sub_area = SubArea.find(params[:id])
    authorize @sub_area
  end

  def sub_area_params
    params.require(:sub_area).permit(:sub_area_name, :sub_area_name_katakana, :sub_area_name_alphabet)
  end
end
