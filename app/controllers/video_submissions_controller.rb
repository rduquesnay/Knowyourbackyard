class VideoSubmissionsController < ApplicationController
  before_action :set_video_submission, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @video_submissions = VideoSubmission.all
    respond_with(@video_submissions)
  end

  def show
    @trail = Trail.find(@video_submission.trail_id)
    respond_with(@video_submission)
  end

  def new
    @trail = Trail.find(params[:id])
    @video_submission = VideoSubmission.new
    respond_with(@video_submission)
  end

  def edit
    @trail = Trail.find(@video_submission.trail_id)
  end

  def create
    @video_submission = VideoSubmission.new(video_submission_params)
    @video_submission.save
    @trail = Trail.find(@video_submission.trail_id)
    respond_with(@trail)
  end

  def update
    @video_submission.update(video_submission_params)
    respond_with(@video_submission)
  end

  def destroy
    @video_submission.destroy
    respond_with(@video_submission)
  end

  private
    def set_video_submission
      @video_submission = VideoSubmission.find(params[:id])
    end

    def video_submission_params
      params.require(:video_submission).permit(:trail_id, :demo_link)
    end
end
