class TrailsController < ApplicationController
  before_action :ensure_admin!, only: :index
  before_action :ensure_trailblazer!, only: :trailsreview
  before_action :authenticate_user!, only: :trailslist
  before_action :set_trail, only: [:show, :edit, :update, :destroy]
  before_action :set_trail_rate, only: :show
  before_action :set_user_rate, only: :show
  before_action :set_trail_updates, only: :show
  before_action :set_trail_comments, only: :show

  respond_to :html

  def index
    @trails = Trail.all
    respond_with(@trails)
  end
  def trailsreview
    @review = Trail.unreviewed
    @revision = Trail.revision
    @disputed = Trail.disputed
  end
  def trailslist
    @trails = Trail.accepted
    respond_with(@trails)
  end
  def show
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
    if(current_user.trailblazer? unless current_user.nil?)
      @trail.status="Accepted"
      @reward = Reward.new(points: 200,trail_id: @trail.id,user_id: current_user.id)
      @reward.save
    end
    @trail.save
    @rating = Rating.new(rate_params)
    @rating.user_id=@trail.user_id 
    @rating.trail_id= @trail.id
    @rating.save
    respond_with(@trail)
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
    def set_trail_rate
      ratings = Rating.where(trail_id: @trail.id)
      diff_sum = 0
      dura_sum = 0
      ratings.each do |rating|
       diff_sum = diff_sum + rating.difficulty
       dura_sum = dura_sum + rating.durationinsec
      end
      @rate = {avg_duration: diff_sum/ratings.count, avg_difficulty: dura_sum/ratings.count}
    end
    def set_user_rate
      @rating = Rating.where(trail_id: @trail.id, user_id: current_user.id).first
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
