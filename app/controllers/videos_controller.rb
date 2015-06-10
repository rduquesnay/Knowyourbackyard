class VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_video, only: :destroy

  def new
    @video = Video.new
  end
  
  def create
    @video = Video.new({trail_id: video_params[:trail_id],src: set_src})
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
      params.require(:video).permit(:trail_id)
    end

    def set_src
      Videoparser.get_src(params[:code]) 
    end
end
