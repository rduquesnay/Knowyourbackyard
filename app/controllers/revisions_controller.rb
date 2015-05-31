class RevisionsController < ApplicationController
  before_action :set_revision, only: [:show, :edit, :update, :destroy]
  before_action :set_trail_rate, only: [:show, :edit]
  respond_to :html

  def index
    @revisions = Revision.all
    respond_with(@revisions)
  end

  def show
    @trail = Trail.find(@revision.trail_id)
    respond_with(@revision)
  end

  def new
    @revision = Revision.new
    @trail = Trail.find(params[:trail_id])
    @rate = Rating.where(trail_id: @trail.id,user_id: @trail.user_id).first
    respond_with(@revision)
  end

  def edit
  end

  def create
    @trail = Trail.find(revision_params[:trail_id])
    if check_params[:check_name] || check_params[:check_location] || check_params[:check_season] || check_params[:check_type] || check_params[:check_gps] || check_params[:check_directions]
      @revision = Revision.new(revision_params)
      @trail.update_attribute(:status, "Under revision")
      @revision.save
      @reward = Reward.new(points: 150, revision_id: @revision.id,user_id: @revision.user_id)
      @user = User.find(@revision.user_id)
      @user.update_attribute(:points, @user.points+@reward.points)
      @reward.save
      @note = Notification.new(message: "Your Trail: id: #{@trail.id} Name: #{@trail.name}, a revision has been submitted for it", link: "<a href=\"\/revisions\/#{@revision.id}\">Go to Revision<\/a>", user_id: @trail.user_id)
      @note.save
    else
      #@user = User.find(@trail.user_id)
      #@trail.update_attribute(:status, "Accepted")
    end
    respond_with(@trail)
  end

  def update
    @revision.update(revision_params)
    respond_with(@revision)
  end

  def destroy
    @revision.destroy
    respond_with(@revision)
  end

  private
    def set_revision
      @revision = Revision.find(params[:id])
    end

    def revision_params
      params.require(:revision).permit(:name_review, :location_review, :season_review, :trailtype_review, :gps_review, :traildirections_review, :trail_id, :user_id)
    end
    def check_params
      params.permit(:check_name, :check_location, :check_season, :check_type, :check_gps, :check_directions)
    end
    def set_trail_rate
      ratings = Rating.where(trail_id: @revision.trail_id)
      diff_sum = 0
      dura_sum = 0
      ratings.each do |rating|
       diff_sum = diff_sum + rating.difficulty
       dura_sum = dura_sum + rating.durationinsec
      end
      @rate = {avg_duration: diff_sum/ratings.count, avg_difficulty: dura_sum/ratings.count}
    end
end
