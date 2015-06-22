class ResolvedrevisiondisputesController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :ensure_trailblazer!, only: [:new, :create, :edit, :update]
  before_action :ensure_admin!, only: [:index, :destroy]
  before_action :set_resolvedrevisiondispute, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @resolvedrevisiondisputes = Resolvedrevisiondispute.all
    respond_with(@resolvedrevisiondisputes)
  end

  def show
    @trail=Trail.find(@resolvedrevisiondispute.trail_id)
    respond_with(@resolvedrevisiondispute)
  end

  def new
    @resolvedrevisiondispute = Resolvedrevisiondispute.new
    @trail = Trail.find(params[:trail_id])
    @revision = Revision.find(params[:revision_id])
    @revisionreview = Revisionreview.find(params[:review_id])
    @revisiondispute = Revisiondispute.find(params[:dispute_id])
    respond_with(@resolvedrevisiondispute)
  end

  def edit
  end

  def create
    @resolvedrevisiondispute = Resolvedrevisiondispute.new(resolvedrevisiondispute_params)
    @revisionreview = Revisionreview.find(@resolvedrevisiondispute.review_id)
    @revision = Revision.find(@revisionreview.revision_id)
    @revisiondispute = Revisiondispute.find(dispute_params[:dispute_id])
    self.class.transaction do
      @resolvedrevisiondispute.save
      @revisiondispute.destroy
      if @resolvedrevisiondispute.dispute_action=="Accepted"
        @revisionreview.destroy
        @notice = Notice.new({type: "Dispute Accepted", link_to: @resolvedrevisiondispute.id, to_user: @revision.user_id, dispute_type: "revision"})
      elsif @resolvedrevisiondispute.dispute_action=="Dismissed"
        @notice = Notice.new({type: "Dispute Dismissed", link_to: @resolvedrevisiondispute.id, to_user: @revision.user_id, dispute_type: "revision"})
      end
      @notice.send
    end
    redirect_to trailreviewindex_path
  end

  def update
    @resolvedrevisiondispute.update(resolvedrevisiondispute_params)
    respond_with(@resolvedrevisiondispute)
  end

  def destroy
    @resolvedrevisiondispute.destroy
    respond_with(@resolvedrevisiondispute)
  end

  private
    def set_resolvedrevisiondispute
      @resolvedrevisiondispute = Resolvedrevisiondispute.find(params[:id])
    end

    def resolvedrevisiondispute_params
      params.require(:resolvedrevisiondispute).permit(:trail_id, :revision_id, :revisied_name, :revisied_location, :revisied_length, :revisied_season, :revisied_trailtype, :revisied_latitude, :revisied_longitude, :revisied_traildirections, :review_id, :name_review, :location_review, :length_review, :season_review, :trailtype_review, :gps_review, :traildirections_review, :finalcomments, :review_user_id, :dispute_comment, :dispute_action, :comment)
    end
    def dispute_params
      params.permit(:dispute_id)
    end
end
