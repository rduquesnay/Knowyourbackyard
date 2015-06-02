class ReviewdiputesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :ensure_trailblazer!, only: [:show, :destroy]
  before_action :ensure_admin!, only: [:index, :update]
  before_action :set_reviewdipute, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reviewdiputes = Reviewdipute.all
    respond_with(@reviewdiputes)
  end

  def show
    respond_with(@reviewdipute)
  end

  def new
    @reviewdipute = Reviewdipute.new
    @id= params[:review_id]
    respond_with(@reviewdipute)
  end

  def edit
  end

  def create
    @reviewdipute = Reviewdipute.new(reviewdipute_params)
    @reviewdipute.save
    respond_with(@reviewdipute)
  end

  def update
    @reviewdipute.update(reviewdipute_params)
    respond_with(@reviewdipute)
  end

  def destroy
    @reviewdipute.destroy
    respond_with(@reviewdipute)
  end

  private
    def set_reviewdipute
      @reviewdipute = Reviewdipute.find(params[:id])
    end

    def reviewdipute_params
      params.require(:reviewdipute).permit(:comment, :review_id)
    end
end
