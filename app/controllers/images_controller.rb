class ImagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :ensure_trailblazer!, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @images = Image.all.order(trail_id: :desc)
    @id = @images.first.trail_id unless @images == []
    respond_with(@images)
  end

  def show
    respond_with(@image)
  end

  def new
    @image = Image.new
    @trail = Trail.find(params[:id])
    respond_with(@image)
  end

  def edit
  end

  def create
    @image = Image.new(image_params)
    @trail = Trail.find(@image.trail_id)
    if @image.save
      redirect_to @trail
    else
      render 'new'
    end
  end

  def update
    @image.update(image_params)
    respond_with(@image)
  end

  def destroy
    @image.destroy
    respond_with(@image)
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:url, :trail_id)
    end
end
