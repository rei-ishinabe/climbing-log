class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR name_katakana ILIKE :query OR name_alphabet ILIKE :query OR address ILIKE :query"
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

    @from = params[:from].to_date unless params[:from].nil?
    @to = params[:to].to_date unless params[:to].nil?
    @routes = @gym.routes.where('routes.user_id = ?', current_user.id).order(id: 'DESC')
    unless @from.nil? | @to.nil?
      @routes = @routes.joins(:logs).where('logs.date BETWEEN ? AND ?', @from, @to )
    else
      if @routes.first.nil?
        @from = Date.today
      elsif @routes.first.log_ids.empty?
        @from = Date.today
      else
        @from = @routes.joins(:logs).select('routes.*, logs.date').order(date: 'ASC').first.date
      end
      @to = Date.today
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
