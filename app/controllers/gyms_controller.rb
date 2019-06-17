class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update]

  def index
    @gyms = policy_scope(Gym).all
  end

  def show
    @markers =
      {
        lat: @gym.latitude,
        lng: @gym.longitude
      }
  end

  def new
    @gym = Gym.new
    authorize @gym
  end

  def create
    @gym = Gym.new(gym_params)
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

  private

  def set_gym
    @gym = Gym.find(params[:id])
    authorize @gym
  end

  def gym_params
    params.require(:gym).permit(:name, :name_katakana, :name_alphabet, :address, :latitude, :longitude)
  end
end
