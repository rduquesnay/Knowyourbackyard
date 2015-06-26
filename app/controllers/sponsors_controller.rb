class SponsorsController < ApplicationController
  before_action :ensure_owner!, only: [:new, :create, :update, :destroy]
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @sponsors = Sponsor.all
    respond_with(@sponsors)
  end

  def show
    respond_with(@sponsor)
  end

  def new
    @sponsor = Sponsor.new
    respond_with(@sponsor)
  end

  def edit
  end

  def create
    @sponsor = Sponsor.new(sponsor_params)
    if @sponsor.save
      respond_with(@sponsor)
    else
      render 'new'
    end
  end

  def update
    @sponsor.update(sponsor_params)
    respond_with(@sponsor)
  end

  def destroy
    @sponsor.destroy
    respond_with(@sponsor)
  end

  private
    def set_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

    def sponsor_params
      params.require(:sponsor).permit(:companyname, :about, :link)
    end
end
