class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR name_katakana ILIKE :query OR name_alphabet ILIKE :query"
      @gyms = policy_scope(Gym).all.where(sql_query, query:"%#{params[:query]}%").order(:name)
    else
      @gyms = policy_scope(Gym).all.order(:name)
    end
  end

  def show
    @markers =
      [{
        lat: @gym.latitude,
        lng: @gym.longitude
      }]
    @routes = @gym.routes.where('user_id = ?', current_user)
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
