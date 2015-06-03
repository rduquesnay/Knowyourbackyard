class RevisiondisputesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :ensure_trailblazer!, only: [:show, :destroy]
  before_action :ensure_admin!, only: [:index, :update]
  before_action :set_revisiondispute, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @revisiondisputes = Revisiondispute.all
    respond_with(@revisiondisputes)
  end

  def show
    @revision = @revisiondispute.revision
    @trail = @revision.trail
    respond_with(@revisiondispute)
  end

  def new
    @revisiondispute = Revisiondispute.new
    respond_with(@revisiondispute)
  end

  def edit
  end

  def create
    @revisiondispute = Revisiondispute.new(revisiondispute_params)
    @revisiondispute.save
    respond_with(@revisiondispute)
  end

  def update
    @revisiondispute.update(revisiondispute_params)
    respond_with(@revisiondispute)
  end

  def destroy
    @revisiondispute.destroy
    respond_with(@revisiondispute)
  end

  private
    def set_revisiondispute
      @revisiondispute = Revisiondispute.find(params[:id])
    end

    def revisiondispute_params
      params.require(:revisiondispute).permit(:comment, :revisionreview_id)
    end
end
