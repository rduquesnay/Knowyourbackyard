class ReviewdisputesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]
  before_action :ensure_trailblazer!, only: [:show, :destroy]
  before_action :ensure_admin!, only: :index
  before_action :set_reviewdispute, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reviewdisputes = Reviewdispute.all
    respond_with(@reviewdisputes)
  end

  def show
    @review = @reviewdispute.review
    @trail = @review.trail
    respond_with(@reviewdispute)
  end

  def new
    @reviewdispute = Reviewdispute.new
    @id= params[:review_id]
    respond_with(@reviewdispute)
  end

  def edit
  end

  def create
    @reviewdispute = Reviewdispute.new(reviewdispute_params)
    @reviewdispute.save
    redirect_to root_path
  end

  def update
    @reviewdispute.update(reviewdispute_params)
    respond_with(@reviewdispute)
  end

  def destroy
    @reviewdispute.destroy
    respond_with(@reviewdispute)
  end

  private
    def set_reviewdispute
      @reviewdispute = Reviewdispute.find(params[:id])
    end

    def reviewdispute_params
      params.require(:reviewdispute).permit(:comment, :review_id)
    end
end
