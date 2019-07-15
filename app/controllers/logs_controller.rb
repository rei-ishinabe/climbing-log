class LogsController < ApplicationController

  def index
    @logs = policy_scope(Log).where('user_id = ?', current_user.id)
  end

  def new
    @gym = Gym.find(params[:gym_id])
    @categories = Category.all
    @log = Log.new
    authorize @log
  end

  def create
    @gym = Gym.find(params[:gym_id])
    @log = Log.new(log_params)
    authorize @log
    @log.gym = @gym
    @log.user = current_user
    binding.pry
    if @log.save
      redirect_to gym_path(@log.gym)
    else
      render :new
    end
  end

  def edit
  end

  private

  def log_params
    params.require(:log).permit(:date, :category_id, :route_type, :route_name, :status, :comment, :image)
  end
end
