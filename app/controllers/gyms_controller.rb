class GymsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_gym, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR name_katakana ILIKE :query OR name_alphabet ILIKE :query OR address ILIKE :query"
      @gyms = policy_scope(Gym).all.where(sql_query, query:"%#{params[:query]}%").order(:name).page(params[:page]).per(10)
    else
      @gyms = policy_scope(Gym).order(:name).page(params[:page]).per(20)
    end

    if user_signed_in?
      @last_five_gyms_visited = current_user.logs.joins(:route).select('routes.gym_id').group('routes.gym_id').maximum('logs.date').sort_by{|gym_id, date| date}.reverse.first(5)
    end
 end

  def show
    @markers =
      [{
        lat: @gym.latitude,
        lng: @gym.longitude
      }]

    @from = params[:from].to_date unless params[:from].nil?
    @to = params[:to].to_date unless params[:to].nil?
    @routes = @gym.routes.where('routes.user_id = ?', current_user.id).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(route_name: 'ASC')
    unless @from.nil? | @to.nil?
      @routes = @routes.joins(:logs).where('logs.date BETWEEN ? AND ?', @from, @to ).group('routes.id')
    else
      if @routes.first.nil?
        @from = Date.today
      elsif @routes.first.log_ids.empty?
        @from = Date.today
      else
        @from = Log.joins(:route).where('routes.user_id = ?', current_user.id).order(date: 'ASC').first.date
      end
      @to = Date.today
    end

    @logs = Log.all.joins(:route).where('logs.date BETWEEN ? AND ? AND routes.user_id = ? AND routes.gym_id  = ?', @from, @to, current_user.id, @gym.id)
    @boulder_best =  @logs.joins(:route).where('routes.category_id = ? and logs.status_id < ?', 1, 4).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first if @logs.exists?
    @lead_best =  @logs.joins(:route).where('routes.category_id = ? and logs.status_id < ?', 2, 4).order(grade_id: 'DESC').order(sub_grade_id: 'DESC').order(date: 'DESC').first if @logs.exists?
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
