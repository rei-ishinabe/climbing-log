class OdLogsController < ApplicationController
  before_action :set_od_log, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @od_route = OdRoute.find(params[:od_route_id])
    @grades = Grade.all
    @sub_grades = SubGrade.all
    @od_log = OdLog.new
    authorize @od_log
  end

  def create
    @od_route = OdRoute.find(params[:od_route_id])
    @od_log = OdLog.new(od_log_params)
    authorize @od_log
    @od_log.od_route = @od_route
    @od_log.user = current_user
    if @od_log.save
      redirect_to od_route_path(@od_route)
    else
      render :new
    end
  end

  def edit
    @od_route = @od_log.od_route
  end

  def update
    if @od_log.update(od_log_params)
      redirect_to od_route_path(@od_log.od_route)
    else
      render :edit
    end
  end

  def destroy
    @od_route = @od_log.od_route
    if @od_log.destroy
      redirect_to od_route_path(@od_route)
    else
      render :show
    end
  end

  private

  def set_od_log
    @od_log = OdLog.find(params[:id])
    authorize @od_log
  end

  def od_log_params
    params.require(:od_log).permit(:date, :status_id, :comment)
  end
end
