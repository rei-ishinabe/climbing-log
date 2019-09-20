class OdRouteReviewsController < ApplicationController
  before_action :set_od_route_review, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @od_route = OdRoute.find(params[:od_route_id])
    @od_route_review = OdRouteReview.new
    authorize @od_route_review
  end

  def create
    @od_route = OdRoute.find(params[:od_route_id])
    @od_route_review = OdRouteReview.new(od_route_review_params)
    authorize @od_route_review
    @od_route_review.od_route = @od_route
    @od_route_review.user = current_user
    if @od_route_review.save
      redirect_to od_route_path(@od_route)
    else
      render :new
    end
  end

  def edit
    @od_route = @od_route_review.od_route
  end

  def update
    if @od_route_review.update(od_route_review_params)
      redirect_to od_route_path(@od_route)
    else
      render :edit
    end
  end

  def destroy
    if @od_route_review.destroy
      redirect_to od_route_path(@od_route)
    else
      render :edit
    end
  end

  private

  def set_od_route_review
    @od_route_review = OdRouteReview.find(params[:id])
    authorize @od_route_review
    @od_route = @od_route_review.od_route
  end

  def od_route_review_params
    params.require(:od_route_review).permit(:comment, :rating, :privacy_setting, :image)
  end
end
