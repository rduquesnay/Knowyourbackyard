class RevisionreviewsController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :ensure_trailblazer!, only: [:new, :create, :edit, :update, :destroy]
  before_action :ensure_admin!, only: :index
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
    @revision = Revision.find(@revisionreview.revision_id)
    @trail = Trail.find(@revision.trail_id)
  end

  def create
    @revision = Revision.find(revisionreview_params[:revision_id])
    @reviewuser = User.find(current_user)
    @revisionreview = Revisionreview.new(revisionreview_params)
    ActiveRecord::Base.transaction do
      if !@revisionreview.save
        raise ActiveRecord::Rollback
      end
      if !@reviewuser.update_attribute(:points, @reviewuser.points+150)
        raise ActiveRecord::Rollback
      end
      notice = Notice.new({type: "Revision Reviewed", link_id: @revisionreview.id, to_user: @revision.user_id})
      if !notice.send
        raise ActiveRecord::Rollback
      end
    end
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
