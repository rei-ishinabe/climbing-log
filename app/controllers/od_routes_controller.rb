class OdRoutesController < ApplicationController
  before_action :set_od_route, only: [:show, :edit, :update, :destroy]

  def index
    @od_routes = policy_scope(OdRoute).all
  end

  def show
    @sub_area = @od_route.sub_area
    @area = @sub_area.area
  end

  def new
    @sub_area = SubArea.find(params[:sub_area_id])
    @grades = Grade.all
    @sub_grades = SubGrade.all
    @od_route = OdRoute.new
    authorize @od_route
  end

  def create
    @sub_area = SubArea.find(params[:sub_area_id])
    @od_route = OdRoute.new(od_route_params)
    authorize @od_route
    @od_route.sub_area = @sub_area
    if @od_route.save
      redirect_to sub_area_path(@sub_area)
    else
      render :new
    end
  end

  def edit
    @sub_area = @od_route.sub_area
  end

  def update
    @sub_area = SubArea.find(params[:sub_area_id])
    @od_route = OdRoute.new(od_route_params)
    authorize @od_route
    @od_route.sub_area = @sub_area
    if @od_route.update(od_route_params)
      redirect_to od_route_path(@od_route)
    else
      render :edit
    end
  end

  def destroy
    if @od_route.destroy
      redirect_to sub_area_path(@od_route.sub_area)
    else
      render :show
    end
  end

  private

  def set_od_route
    @od_route = OdRoute.find(params[:id])
    authorize @od_route
  end

  def od_route_params
    params.require(:od_route).permit(:route_name, :route_name_katakana, :route_name_alphabet, :grade_id, :sub_grade_id, :sub_area_id, :category_id)
  end

end
