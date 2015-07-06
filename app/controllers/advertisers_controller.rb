class AdvertisersController < ApplicationController
  before_action :ensure_admin!, only: [:index, :show, :destroy]
  before_action :set_advertiser, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @advertisers = Advertiser.all
    respond_with(@advertisers)
  end

  def show
    respond_with(@advertiser)
  end

  def new
    @advertiser = Advertiser.new
    respond_with(@advertiser)
  end

  def edit
    respond_with(@advertiser)
  end

  def create
    @advertiser = Advertiser.new(advertiser_params)
    if @advertiser.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @advertiser.update(advertiser_params)
    respond_with(@advertiser)
  end

  def destroy
    @advertiser.destroy
    respond_with(@advertiser)
  end

  private
    def set_advertiser
      @advertiser = Advertiser.find(params[:id])
    end

    def advertiser_params
      params.require(:advertiser).permit(:name, :email, :phone, :message)
    end
end
