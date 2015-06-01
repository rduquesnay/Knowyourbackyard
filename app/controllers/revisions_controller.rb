class RevisionsController < ApplicationController
  before_action :ensure_trailblazer!, only: :show
  before_action :ensure_admin!, only: :index
  before_action :set_revision, only: [:show, :edit, :update, :destroy]
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
    respond_with(@revision)
  end

  def edit
  end

  def create
    @trail = Trail.find(revision_params[:trail_id])
    @revision = Revision.new(revision_params)
    @revision.save
    #@note = Notification.new(message: "Your Trail: id: #{@trail.id} Name: #{@trail.name}, a revision has been submitted for it", link: "<a href=\"\/revisions\/#{@revision.id}\">Go to Revision<\/a>", user_id: @trail.user_id)
    #@note.save
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
end
