class ResolvedreviewdisputesController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :ensure_trailblazer!, only: [:new, :edit]
  before_action :ensure_admin!, only: [:index, :update, :destroy]
  before_action :set_resolvedreviewdispute, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @resolvedreviewdisputes = Resolvedreviewdispute.all
    respond_with(@resolvedreviewdisputes)
  end

  def show
    @trail=Trail.find(@resolvedreviewdispute.trail_id)
    respond_with(@resolvedreviewdispute)
  end

  def new
    @resolvedreviewdispute = Resolvedreviewdispute.new
    @trail = Trail.find(params[:trail_id])
    @review = Review.find(params[:review_id])
    @reviewdispute = Reviewdispute.find(params[:dispute_id])
    respond_with(@resolvedreviewdispute)
  end

  def edit
  end

  def create
    @resolvedreviewdispute = Resolvedreviewdispute.new(resolvedreviewdispute_params)
    @resolvedreviewdispute.save
    @review = Review.find(@resolvedreviewdispute.review_id)
    @trail = Trail.find(@resolvedreviewdispute.trail_id)
    @reviewdispute = Reviewdispute.find(dispute_params[:dispute_id])
    @reviewdispute.destroy
    if @resolvedreviewdispute.dispute_action=="Accepted"
      @review.destroy
      @note = Notification.new(message: "Your Dispute has been Accepted.", link: "<a class=\"btn btn-primary\" href=\"\/resolvedreviewdisputes\/#{@resolvedreviewdispute.id}\">Go to Resolved Dispute<\/a>", user_id: @trail.user_id)
    elsif @resolvedrevisiondispute.dispute_action=="Dismissed"
      @note = Notification.new(message: "Your Dispute has been Dismissed.", link: "<a class=\"btn btn-primary\" href=\"\/resolvedreviewdisputes\/#{@resolvedreviewdispute.id}\">Go to Resolved Dispute<\/a>", user_id: @trail.user_id)
    end
    @note.save
    redirect_to trailreviewindex_path
  end

  def update
    @resolvedreviewdispute.update(resolvedreviewdispute_params)
    respond_with(@resolvedreviewdispute)
  end

  def destroy
    @resolvedreviewdispute.destroy
    respond_with(@resolvedreviewdispute)
  end

  private
    def set_resolvedreviewdispute
      @resolvedreviewdispute = Resolvedreviewdispute.find(params[:id])
    end

    def resolvedreviewdispute_params
      params.require(:resolvedreviewdispute).permit(:trail_id, :review_id, :name_review, :location_review, :rating_difficulty_review, :rating_duration_review, :season_review, :trailtype_review, :length_review, :gps_review, :traildirections_review, :finalcomments, :review_user_id, :dispute_comment, :dispute_action, :comment)
    end
    def dispute_params
      params.permit(:dispute_id)
    end
end
