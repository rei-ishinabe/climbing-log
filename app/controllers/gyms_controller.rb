class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR name_katakana ILIKE :query OR name_alphabet ILIKE :query"
      @gyms = policy_scope(Gym).all.where(sql_query, query:"%#{params[:query]}%").order(:name).page(params[:page]).per(10)
    else
      @gyms = policy_scope(Gym).order(:name).page(params[:page]).per(20)
    end

    @last_five_gyms_visited = current_user.logs.joins(:route).select('routes.gym_id').group('routes.gym_id').maximum('logs.date').sort_by{|gym_id, date| date}.reverse.first(5)
  end

  def show
    @markers =
      [{
        lat: @gym.latitude,
        lng: @gym.longitude
      }]
    @routes = @gym.routes.where('user_id = ?', current_user)

    case params[:period]
    when 'yesterday' then
      @from_date = Date.yesterday
      @to_date = Date.yesterday
      @routes = @gym.routes.joins(:logs).where('logs.date = ? AND routes.user_id = ?', @from_date, current_user.id)
    when 'today' then
      @from_date = Date.today
      @to_date = Date.today
      @routes = @gym.routes.joins(:logs).where('logs.date = ? AND routes.user_id = ?', @from_date, current_user.id)
    when 'lastweek' then
      @from_date = Date.today.prev_week.beginning_of_week
      @to_date = Date.today.prev_week.end_of_week
      @routes = @gym.routes.joins(:logs).where('logs.date = ? AND routes.user_id = ?', @from_date, current_user.id)
    when 'thisweek' then
      @from_date = Date.today.beginning_of_week
      @to_date = Date.today.end_of_week
      @routes = @gym.routes.joins(:logs).where('logs.date = ? AND routes.user_id = ?', @from_date, current_user.id)
    when 'lastmonth' then
      @from_date = Date.today.prev_month.beginning_of_month
      @to_date = Date.today.prev_month.end_of_month
      @routes = @gym.routes.joins(:logs).where('logs.date = ? AND routes.user_id = ?', @from_date, current_user.id)
    when 'thismonth' then
      @from_date = Date.today.beginning_of_month
      @to_date = Date.today.end_of_month
      @routes = @gym.routes.joins(:logs).where('logs.date = ? AND routes.user_id = ?', @from_date, current_user.id)
    when 'thisyear' then
      @from_date = Date.today.beginning_of_year
      @to_date = Date.today.end_of_year
      @routes = @gym.routes.joins(:logs).where('logs.date = ? AND routes.user_id = ?', @from_date, current_user.id)
    when 'lastyear' then
      @from_date = Date.today.prev_year.beginning_of_year
      @to_date = Date.today.prev_year.end_of_year
      @routes = @gym.routes.joins(:logs).where('logs.date = ? AND routes.user_id = ?', @from_date, current_user.id)
    else
      @routes = @gym.routes.joins(:logs).where('routes.user_id = ?', current_user.id)
      if @routes.first.nil?
        @from_date = Date.today
      else
        @from_date = @gym.logs.joins(:route).where('routes.user_id = ?', current_user.id).order(date: 'ASC').first.date
      end
      @to_date = Date.today
    end
  end

  def new
    @gym = Gym.new
    authorize @gym
  end

  def create
    @gym = Gym.new(gym_params)
    authorize @gym
    if @gym.save
      redirect_to gym_path(@gym)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @gym.update(gym_params)
      redirect_to gym_path(@gym)
    else
      render :edit
    end
  end

  def destroy
    if @gym.destroy
      redirect_to gyms_path
    else
      render :edit
    end
  end

  private

  def set_gym
    @gym = Gym.find(params[:id])
    authorize @gym
  end

  def gym_params
    params.require(:gym).permit(:name, :name_katakana, :name_alphabet, :address, :latitude, :longitude)
  end
end
