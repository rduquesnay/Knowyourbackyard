class RevisionsController < ApplicationController
  before_action :set_revision, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @revisions = Revision.all
    respond_with(@revisions)
  end

  def show
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
    if check_params[:check_name] || check_params[:check_location] || check_params[:check_season] || check_params[:check_type] || check_params[:check_gps] || check_params[:check_directions]
      @revision = Revision.new(revision_params)
      @trail = Trail.find(@review.trail_id)
      @trail.update_attribute(:status, "Under revision")
      @revision.save
      @note = Notification.new(message: "Your Trail: id: #{@trail.id} Name: #{@trail.name}, a revision has been submitted for it", link: "<a href=\"\/revisions\/#{@revision.id}\">Go to Revision<\/a>", user_id: @trail.user_id)
      @note.save
      respond_with(@trail)
    else
      @trail = Trail.find(review_params[:trail_id])
      #@user = User.find(@trail.user_id)
      #@trail.update_attribute(:status, "Accepted")
      respond_with(@trail)
    end
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
end
