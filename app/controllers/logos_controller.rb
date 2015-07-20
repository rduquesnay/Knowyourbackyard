class LogosController < ApplicationController
  before_action :ensure_owner!
  before_action :set_logo, only: [:show, :edit, :update, :destroy]

  respond_to :html
  def new
    @id = params[:id]
    @logo = Logo.new
    respond_with(@logo)
  end

  def edit
  end

  def create
    @logo = Logo.new(logo_params)
    @sponsor = Sponsor.find(@logo.sponsor_id)
    if @logo.save
      redirect_to sponsors_path
    else
      render 'new'
    end
  end

  def update
    @sponsor = Sponsor.find(@logo.sponsor_id)
    if @logo.update(logo_params)
      redirect_to sponsors_path
    else
      render 'edit'
    end
  end

  def destroy
    @logo.destroy
    respond_with(@logo)
  end

  private
    def set_logo
      @logo = Logo.find(params[:id])
    end

    def logo_params
      params.require(:logo).permit(:url, :sponsor_id)
    end
end
