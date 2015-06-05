class ResolvedreviewdisputesController < ApplicationController
  before_action :set_resolvedreviewdispute, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @resolvedreviewdisputes = Resolvedreviewdispute.all
    respond_with(@resolvedreviewdisputes)
  end

  def show
    respond_with(@resolvedreviewdispute)
  end

  def new
    @resolvedreviewdispute = Resolvedreviewdispute.new
    respond_with(@resolvedreviewdispute)
  end

  def edit
  end

  def create
    @resolvedreviewdispute = Resolvedreviewdispute.new(resolvedreviewdispute_params)
    @resolvedreviewdispute.save
    respond_with(@resolvedreviewdispute)
  end

  def update
    @resolvedreviewdispute.update(resolvedreviewdispute_params)
    respond_with(@resolvedreviewdispute)
  end

  def destroy
    @resolvedreviewdispute.destroy
    respond_with(@resolvedreviewdispute)
  end

  private
    def set_resolvedreviewdispute
      @resolvedreviewdispute = Resolvedreviewdispute.find(params[:id])
    end

    def resolvedreviewdispute_params
      params.require(:resolvedreviewdispute).permit(:trail_id, :review_id, :name_review, :location_review, :rating_difficulty_review, :rating_duration_review, :season_review, :trailtype_review, :length_review, :gps_review, :traildirections_review, :finalcomments, :review_user_id, :dispute_comment, :dispute_action, :comment)
    end
end
