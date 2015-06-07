class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :ensure_trailblazer!, only: [:new, :create, :edit, :destroy]
  before_action :ensure_admin!, only: [:index,:update]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reviews = Review.all
    respond_with(@reviews)
  end

  def show
    @trail = Trail.find(@review.trail_id)
    respond_with(@review)
  end

  def new
    @review = Review.new
    @trail = Trail.find(params[:trail_id])
    respond_with(@review)
  end

  def edit
  end

  def create
    @trail = Trail.find(review_params[:trail_id])
    @reviewuser = User.find(current_user.id)
    if check_params[:check_name] || check_params[:check_location] || check_params[:check_difficulty] || check_params[:check_duration] || check_params[:check_season] || check_params[:check_type] || check_params[:check_length] || check_params[:check_gps] || check_params[:check_directions]
      @review = Review.new(review_params)
      @trail.update_attribute(:status, "Under review")
      @review.save
      @note = Notification.new(message: "Your Trail: id: #{@trail.id} Name: #{@trail.name}, has been reviewed and changes are requested.", link: "<a class=\"btn btn-primary\" href=\"\/reviews\/#{@review.id}\">Go to Trail Review<\/a>", user_id: @trail.user_id)
    else
      @trailuser = User.find(@trail.user_id)
      @trail.update_attribute(:status, "Accepted")
      @trailuser.update_attribute(:points, @trailuser.points+200)
      @note = Notification.new(message: "Your Trail: id: #{@trail.id} Name: #{@trail.name}, has been reviewed and accepted.", link: "<a class=\"btn btn-primary\" href=\"\/trails\/#{@trail.id}\">Go to Trail<\/a>", user_id: @trail.user_id)
    end
    @reviewuser.update_attribute(:points, @reviewuser.points+150)
    @note.save
    respond_with(@trail)
  end

  def update
    @review.update(review_params)
    respond_with(@review)
  end

  def destroy
    @review.destroy
    respond_with(@review)
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:name_review, :location_review,:length_review, :rating_difficulty_review, :rating_duration_review, :season_review, :trailtype_review, :gps_review, :traildirections_review, :finalcomments, :trail_id, :user_id)
    end
    def check_params
      params.permit(:check_name, :check_location, :check_length, :check_difficulty, :check_duration, :check_season, :check_type, :check_length, :check_gps, :check_directions)
    end
end
