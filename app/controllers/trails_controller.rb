class TrailsController < ApplicationController
  before_action :ensure_admin!, only: [:index,:trailslist, :destory]
  before_action :authenticate_user!, only: [:new, :edit, :update, :trailslist, :create]
  before_action :set_trail, only: [:show, :edit, :update, :destroy]
  before_action :check_for_guest, only: :show
  before_action :set_user_rate, only: :show
  before_action :set_trail_updates, only: :show
  before_action :set_trail_comments, only: :show

  respond_to :html

  def index
    @trails = Trail.all
    respond_with(@trails)
  end
  def trailslist
    @trails = Trail.accepted
    respond_with(@trails)
  end
  def show
    @video = Video.where(trail_id: @trail.id).first
    respond_with(@trail)
  end

  def new
    @trail = Trail.new
    respond_with(@trail)
  end

  def edit
  end

  def create
    @trail = Trail.new(trail_params)
    @rating = Rating.new(rate_params)
    newtrail = Posttrail.new({trail: @trail,rating: @rating})
    if newtrail.post
      respond_with(@trail)
    else
      redirect_to 'new'
    end
  end

  def update
    @trail.update(trail_params)
    if @trail.status == "Under review" 
      @trail.update_attribute(:status, "To be reviewed")
    end
    respond_with(@trail)
  end

  def destroy
    @updates = []
    @ratings = []
    @comments = []
    @reviews = []
    @revisions = []
    @updates = Trailupdate.where(trail_id: @trail.id)
    @ratings = Rating.where(trail_id: @trail.id)
    @comments = Comment.where(trail_id: @trail.id)
    @reviews = Review.where(trail_id: @trail.id)
    @revisions = Revision.where(trail_id: @trail.id)
    @trail.destroy
    @updates.each do |trailupdate|
      trailupdate.destroy
    end
    @ratings.each do |rate|
      rate.destroy
    end
    @comments.each do |comment|
      comment.destroy
    end
    @reviews.each do |review|
      review.destroy
    end
    @revisions.each do |revision|
      revision.destroy
    end
    respond_with(@trail)
  end

  private
    def set_trail
      @trail = Trail.find(params[:id])
    end
    def check_for_guest
      unless @trail.viewbyguest
        authenticate_user!
      end
    end
    def set_user_rate
      @rating=nil
      if user_signed_in?
        @rating = Rating.where(trail_id: @trail.id, user_id: current_user.id).first
      end
    end

    def set_trail_comments
      @comments = []
      @comments = Comment.where(trail_id: @trail.id).order(created_at: :asc).includes(:user)
    end

    def set_trail_updates
      @updates = []
      @updates = Trailupdate.where(trail_id: @trail.id).order(created_at: :desc).includes(:user)
    end

    def trail_params
      params.require(:trail).permit(:name, :location, :length, :season, :trailtype, :latitude, :longitude, :traildirections, :user_id)
    end

    def rate_params
      params.require(:trail).require(:ratings_attributes).require(:"0").permit(:difficulty, :durationinsec, :favourite)
    end
end

