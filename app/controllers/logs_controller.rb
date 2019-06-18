class LogsController < ApplicationController
  def new
    @gym = Gym.find(params[:gym_id])
    @log = Log.new
    authorize @log
  end

  def create
    @gym = Gym.find(params[:gym_id])
    @log = Log.new(log_params)
    authorize @log
    @log.gym = @gym
    @log.user = current_user
    if @log.save
      redirect_to gym_path(@log.gym)
    else
      render :new
    end
  end

  def edit
  end

  def index
  end

  private

  def log_params
    params.require(:log).permit(:date, :category, :route_type, :route_name, :grade, :sub_grade, :status, :comment, :image)
  end
end
