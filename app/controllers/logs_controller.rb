class LogsController < ApplicationController

  def index
    case params[:period]
    when 'yesterday' then
      @from_date = Date.yesterday
      @to_date = Date.yesterday
      @logs = policy_scope(Log).joins(:route).where('logs.date = ? AND routes.user_id = ?', @from_date, current_user.id)
    when 'today' then
      @from_date = Date.today
      @to_date = Date.today
      @logs = policy_scope(Log).joins(:route).where('logs.date = ? AND routes.user_id = ?', @from_date, current_user.id)
    when 'lastweek' then
      @from_date = Date.today.prev_week.beginning_of_week
      @to_date = Date.today.prev_week.end_of_week
      @logs = policy_scope(Log).joins(:route).where('logs.date BETWEEN ? AND ? AND routes.user_id = ?', @from_date, @to_date, current_user.id)
    when 'thisweek' then
      @from_date = Date.today.beginning_of_week
      @to_date = Date.today.end_of_week
      @logs = policy_scope(Log).joins(:route).where('logs.date BETWEEN ? AND ? AND routes.user_id = ?', @from_date, @to_date, current_user.id)
    when 'lastmonth' then
      @from_date = Date.today.prev_month.beginning_of_month
      @to_date = Date.today.prev_month.end_of_month
      @logs = policy_scope(Log).joins(:route).where('logs.date BETWEEN ? AND ? AND routes.user_id = ?', @from_date, @to_date, current_user.id)
    when 'thismonth' then
      @from_date = Date.today.beginning_of_month
      @to_date = Date.today.end_of_month
      @logs = policy_scope(Log).joins(:route).where('logs.date BETWEEN ? AND ? AND routes.user_id = ?', @from_date, @to_date, current_user.id)
    when 'thisyear' then
      @from_date = Date.today.beginning_of_year
      @to_date = Date.today.end_of_year
      @logs = policy_scope(Log).joins(:route).where('logs.date BETWEEN ? AND ? AND routes.user_id = ?', @from_date, @to_date, current_user.id)
    when 'lastyear' then
      @from_date = Date.today.prev_year.beginning_of_year
      @to_date = Date.today.prev_year.end_of_year
      @logs = policy_scope(Log).joins(:route).where('logs.date BETWEEN ? AND ? AND routes.user_id = ?', @from_date, @to_date, current_user.id)
    else
      @logs = policy_scope(Log).joins(:route).where('routes.user_id = ?', current_user.id)
      if @logs.first.nil?
        @from_date = Date.today
      else
        @from_date = @logs.order(date: 'ASC').first.date
      end
      @to_date = Date.today
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
