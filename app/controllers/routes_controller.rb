class RoutesController < ApplicationController
  def index
    @routes = policy_scope(Route).where('user_id = ?', current_user.id)
  end

  def new
    @gym = Gym.find(params[:gym_id])
    @categories = Category.all
    @grades = Grade.all
    @sub_grades = SubGrade.all
    @route = Route.new
    authorize @route
  end

  def create
    @gym = Gym.find(params[:gym_id])
    @route = Route.new(route_params)
    authorize @route
    @route.gym = @gym
    @route.user = current_user
    if @route.save
      redirect_to gym_path(@gym)
    else
      render :new
    end
  end

  def show
    @route = Route.find(params[:id])
    authorize @route
  end

  def edit
  end

  def destroy
    @route = Route.find(params[:id])
    authorize @route
    if @route.destroy
      redirect_to gym_path(@route.gym_id)
    else
      render :show
    end
  end

  private

  def route_params
    params.require(:route).permit(:route_type, :image, :route_name, :comment, :category_id, :grade_id, :sub_grade_id, :gym_id)
  end
end
