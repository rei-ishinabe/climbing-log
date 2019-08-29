class OdRoutesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @sub_area = SubArea.find(params[:sub_area_id])
    @grades = Grade.all
    @sub_grades = SubGrade.all
    @od_route = OdRoute.new
    authorize @od_route
  end

  def edit
  end
end
