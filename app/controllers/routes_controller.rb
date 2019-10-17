class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

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
    if @route.grade_id < 20
      @route.grade_for_chart = 20 - (@route.grade_id.to_f - 19) * 0.25
    else
      if @route.sub_grade_id.nil?
          @route.grade_for_chart = @route.grade_id.to_f +0.375
      else
        @route.grade_for_chart = @route.grade_id.to_f + (@route.sub_grade_id.to_f - 2) * 0.125
      end
    end
    if @route.save
      redirect_to new_route_log_path(@route)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @route.update(route_params)
      if @route.grade_id < 20
        @route.grade_for_chart = 20 - (@route.grade_id.to_f - 19) * 0.25
      else
        if @route.sub_grade_id.nil?
            @route.grade_for_chart = @route.grade_id.to_f +0.375
        else
          @route.grade_for_chart = @route.grade_id.to_f + (@route.sub_grade_id.to_f - 2) * 0.125
        end
      end
      @route.save
      redirect_to gym_path(@gym)
    else
      render :edit
    end
  end

  def destroy
    if @route.destroy
      redirect_to gym_path(@gym)
    else
      render :show
    end
  end

  private

  def set_route
    @route = Route.find(params[:id])
    authorize @route
    @gym = @route.gym
  end

  def route_params
    params.require(:route).permit(:route_type, :image, :route_name, :comment, :category_id, :grade_id, :sub_grade_id, :gym_id)
  end
end
