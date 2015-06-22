class VideomakerSubmissionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update]
  before_action :ensure_admin!, only: [:index, :destroy]
  before_action :set_videomaker_submission, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @videomaker_submissions = VideomakerSubmission.all
    respond_with(@videomaker_submissions)
  end

  def show
    respond_with(@videomaker_submission)
  end

  def new
    @videomaker_submission = VideomakerSubmission.new
    respond_with(@videomaker_submission)
  end

  def edit
  end

  def create
    @videomaker_submission = VideomakerSubmission.new(videomaker_submission_params)
    @videomaker_submission.save
    respond_with(@videomaker_submission)
  end

  def update
    @videomaker_submission.update(videomaker_submission_params)
    respond_with(@videomaker_submission)
  end

  def destroy
    @videomaker_submission.destroy
    respond_with(@videomaker_submission)
  end

  private
    def set_videomaker_submission
      @videomaker_submission = VideomakerSubmission.find(params[:id])
    end

    def videomaker_submission_params
      params.require(:videomaker_submission).permit(:user_id, :demo_link, :about)
    end
end
