class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reviews = Review.all
    respond_with(@reviews)
  end

  def show
    respond_with(@review)
  end

  def new
    @review = Review.new
    @trail = Trail.find(params[:trail_id])
    @rate = Rating.where(trail_id: @trail.id,user_id: @trail.user_id).first
    respond_with(@review)
  end

  def edit
  end

  def create
    @trail = Trail.find(review_params[:trail_id])
    @reviewuser = User.find(current_user.id)
    if check_params[:check_name] || check_params[:check_location] || check_params[:check_difficulty] || check_params[:check_duration] || check_params[:check_season] || check_params[:check_type] || check_params[:check_gps] || check_params[:check_directions]
      @review = Review.new(review_params)
      @trail.update_attribute(:status, "Under review")
      @review.save
      @note = Notification.new(message: "Your Trail: id: #{@trail.id} Name: #{@trail.name}, has been reviewed and changes are requested.", link: "<a href=\"\/trails\/#{@trail.id}\">Go to Trail<\/a>", user_id: @trail.user_id)
      @reviewreward = Reward.new(points: 150, review_id: @review.id, user_id: @review.user_id)
    else
      @trailuser = User.find(@trail.user_id)
      @trail.update_attribute(:status, "Accepted")
      @reviewreward = Reward.new(points: 150, user_id: @reviewuser.id)
      @trailreward = Reward.new(points: 200, trail_id: @trail.id, user_id: @trailuser.id)
      @trailuser.update_attribute(:points, @trailuser.points+@trailreward.points)
      @trailreward.save
      @note = Notification.new(message: "Your Trail: id: #{@trail.id} Name: #{@trail.name}, has been reviewed and accepted.", link: "<a href=\"\/trails\/#{@trail.id}\">Go to Trail<\/a>", user_id: @trail.user_id)
      if Trail.where(user_id: @trailuser.id, status: "Accepted").count >= 7
        @trailuser.update_attribute(:trailblazer, true)
        @promte = Notification.new(message: "You Have been upgraded to a Trailblazer.", link: "<a href=\"\\/user\/profile\/#{@trail.user_id}\">Go to Profile<\/a>", user_id: @trail.user_id)
        @promte.save
      end
    end
    @reviewuser.update_attribute(:points, @reviewuser.points+@reviewreward.points)
    @reviewreward.save
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
      params.require(:review).permit(:name_review, :location_review, :rating_difficulty_review, :rating_duration_review, :season_review, :trailtype_review, :gps_review, :traildirections_review, :finalcomments, :trail_id, :user_id)
    end
    def check_params
      params.permit(:check_name, :check_location, :check_difficulty, :check_duration, :check_season, :check_type, :check_gps, :check_directions)
    end
end
