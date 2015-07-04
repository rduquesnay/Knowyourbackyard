class RevisionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destory]
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
    @images = @trail.images.load
    respond_with(@revision)
  end

  def new
    @revision = Revision.new
    @trail = Trail.find(params[:trail_id])
    @images = @trail.images.load unless @trail.images.nil?
    respond_with(@revision)
  end

  def edit
    @trail = Trail.find(@revision.trail_id)
    @images = @trail.images.load unless @trail.images.nil?
  end

  def create
    @revision = Revision.new(revision_params)
    @trail = Trail.find(@revision.trail_id)
    @revision.save
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
      params.require(:revision).permit(:name, :location, :season, :length, :trailtype, :latitude,:longitude, :traildirections, :trail_id, :user_id, :images)
    end
end
