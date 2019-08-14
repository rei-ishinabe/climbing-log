class LogsController < ApplicationController

  def index
    @from = params[:from].to_date unless params[:from].nil?
    @to = params[:to].to_date unless params[:to].nil?
    unless @from.nil? | @to.nil?
      @logs = policy_scope(Log).joins(:route).where('logs.date BETWEEN ? AND ? AND routes.user_id = ?', @from, @to, current_user.id)
    else
      @logs = policy_scope(Log).joins(:route).where('routes.user_id = ?', current_user.id)
      if @logs.first.nil?
        @from = Date.today
      else
        @from = @logs.order(date: 'ASC').first.date
      end
      @to = Date.today
    end
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
      redirect_to route_path(@log.route)
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
    params.require(:log).permit(:date, :status_id, :comment, :image, :period)
  end
end
