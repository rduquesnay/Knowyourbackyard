class VideosController < ApplicationController
  before_action :ensure_admin!
  before_action :set_video, only: :destroy

  def new
    @video = Video.new
    @trail_id = params[:id]
  end
  
  def create
    @video = Video.new(video_params)
    @video.save
    redirect_to @video.trail_id
  end

  def destroy
    @video.destroy
    redirect_to @video.trail_id
  end

  private
    def set_video
      @video = Video.find(params[:id])
    end
    def video_params
      params.require(:video).permit(:src,:trail_id)
    end
end
