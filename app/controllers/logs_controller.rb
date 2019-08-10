class LogsController < ApplicationController

  def index
    @logs = policy_scope(Log).where('user_id = ?', current_user.id)
  end

  def new
    @route = Route.find(params[:route_id])
    @statuses = Status.all
    @log = Log.new
    authorize @log
  end

  def create
    @route = Route.find(params[:route_id])
    @log = Log.new(log_params)
    authorize @log
    @log.route = @route
    if @log.save
      redirect_to gym_path(@log.route.gym)
    else
      render :new
    end
  end

  def edit
    @route = Route.find(params[:route_id])
    @log = Log.find(params[:id])
    authorize @log
  end

  def update
    @route = Route.find(params[:route_id])
    @log = Log.find(params[:id])
    authorize @log
    if @log.update(log_params)
      redirect_to gym_path(@log.route.gym)
    else
      render :edit
    end
  end

  def destroy
    @log = Log.find(params[:id])
    authorize @log
    if @log.destroy
      redirect_to route_path(@log.route)
    else
      render :show
    end
  end

  private

  def log_params
    params.require(:log).permit(:date, :status_id, :comment, :image)
  end
end
