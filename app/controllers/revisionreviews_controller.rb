class RevisionreviewsController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :ensure_trailblazer!, only: [:new, :create, :edit, :destroy]
  before_action :ensure_admin!, only: [:index,:update]
  before_action :set_revisionreview, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @revisionreviews = Revisionreview.all
    respond_with(@revisionreviews)
  end

  def show
    @revision = Revision.find(@revisionreview.revision_id)
    @trail = Trail.find(@revision.trail_id)
    respond_with(@revisionreview)
  end

  def new
    @revisionreview = Revisionreview.new
    @revision = Revision.find(params[:revision_id])
    @trail = Trail.find(@revision.trail_id)
    respond_with(@revisionreview)
  end

  def edit
  end

  def create
    @revision = Revision.find(revisionreview_params[:revision_id])
    @reviewuser = User.find(current_user)
    @revisionreview = Revisionreview.new(revisionreview_params)
    @revisionreview.save
    @reviewuser.update_attribute(:points, @reviewuser.points+150)
    @note = Notification.new(message: "Your Revision has been reviewed and changes are requested.", link: "<a href=\"\/revisionreviews\/#{@revisionreview.id}\">Go to Revision Review<\/a>", user_id: @revision.user_id)
    @note.save
    respond_with(@revisionreview)
  end

  def update
    @revisionreview.update(revisionreview_params)
    respond_with(@revisionreview)
  end

  def destroy
    @revisionreview.destroy
    respond_with(@revisionreview)
  end

  private
    def set_revisionreview
      @revisionreview = Revisionreview.find(params[:id])
    end

    def revisionreview_params
      params.require(:revisionreview).permit(:name_review, :location_review, :season_review, :length_review, :trailtype_review, :gps_review, :traildirection_review, :finalcomments, :user_id, :revision_id)
    end
end
