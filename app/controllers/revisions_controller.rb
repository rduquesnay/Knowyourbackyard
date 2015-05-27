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
    respond_with(@revision)
  end

  def edit
  end

  def create
    @revision = Revision.new(revision_params)
    @revision.save
    respond_with(@revision)
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
