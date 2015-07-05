class VideosController < ApplicationController
  before_action :ensure_admin!
  before_action :set_video, only: [:edit, :update, :destroy]

  def new
    @video = Video.new
    @trail_id = params[:id]
  end

  def edit
  end
  
  def create
    @video = Video.new(video_params)
    @trail = Trail.find(@video.trail_id)
    if @video.save
      redirect_to @trail
    else
      render 'new'
    end
  end

  def update
    @video.update(video_params)
    redirect_to @trail
  end

  def destroy
    @video.destroy
    redirect_to @trail
  end

  private
    def set_video
      @video = Video.find(params[:id])
      @trail = Trail.find(@video.trail_id)
    end
    def video_params
      params.require(:video).permit(:src,:trail_id)
    end
end
