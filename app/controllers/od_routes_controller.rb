class OdRoutesController < ApplicationController
  before_action :set_od_route, only: [:show, :edit, :update, :destroy]

  def index
    @od_routes = policy_scope(OdRoute).all
  end

  def show
    @sub_area = @od_route.sub_area
    @area = @sub_area.area
    @od_logs = @od_route.od_logs.where('od_logs.user_id = ?', current_user.id)
    @od_route_reviews = @od_route.od_route_reviews.where('od_route_reviews.user_id = ? OR od_route_reviews.privacy_setting > ?', current_user.id, 0)
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
    if @od_route.grade_id < 20
      @od_route.grade_for_chart = 20 - (@od_route.grade_id.to_f - 19) * 0.25
    else
      if @od_route.sub_grade_id.nil?
          @od_route.grade_for_chart = @od_route.grade_id.to_f +0.375
      else
        @od_route.grade_for_chart = @od_route.grade_id.to_f + (@od_route.sub_grade_id.to_f - 2) * 0.125
      end
    end
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
    if @od_route.update(od_route_params)
      if @od_route.grade_id < 20
        @od_route.grade_for_chart = 20 - (@od_route.grade_id.to_f - 19) * 0.25
      else
        if @od_route.sub_grade_id.nil?
            @od_route.grade_for_chart = @od_route.grade_id.to_f +0.375
        else
          @od_route.grade_for_chart = @od_route.grade_id.to_f + (@od_route.sub_grade_id.to_f - 2) * 0.125
        end
      end
      @od_route.save
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
    params.require(:od_route).permit(:route_name, :route_name_katakana, :route_name_alphabet, :grade_id, :sub_grade_id, :sub_area_id, :category_id, :route_type)
  end

end
