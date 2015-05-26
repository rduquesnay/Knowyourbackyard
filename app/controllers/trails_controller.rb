class TrailsController < ApplicationController
  before_action :set_trail, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @trails = Trail.all
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
    @trail.user_id=current_user.id unless current_user.nil?
    if(current_user.trailblazer? unless current_user.nil?)
      @trail.status="Accepted"
    end
    @trail.save
    @rating = Rating.new(rate_params)
    @rating.user_id= current_user.id unless current_user.nil?
    @rating.trail_id= @trail.id
    @rating.save
    respond_with(@trail)
  end

  def update
    @trail.update(trail_params)
    respond_with(@trail)
  end

  def destroy
    @trail.destroy
    respond_with(@trail)
  end

  private
    def set_trail
      @trail = Trail.find(params[:id])
    end

    def trail_params
      params.require(:trail).permit(:name, :location, :length, :season, :trailtype, :latitude, :longitude, :traildirections)
    end
    def rate_params
      params.require(:trail).require(:ratings_attributes).require(:"0").permit(:difficulty, :durationinsec, :favourite)
    end
end
