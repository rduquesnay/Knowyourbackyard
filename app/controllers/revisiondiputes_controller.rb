class RevisiondiputesController < ApplicationController
  before_action :set_revisiondipute, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @revisiondiputes = Revisiondipute.all
    respond_with(@revisiondiputes)
  end

  def show
    respond_with(@revisiondipute)
  end

  def new
    @revisiondipute = Revisiondipute.new
    respond_with(@revisiondipute)
  end

  def edit
  end

  def create
    @revisiondipute = Revisiondipute.new(revisiondipute_params)
    @revisiondipute.save
    respond_with(@revisiondipute)
  end

  def update
    @revisiondipute.update(revisiondipute_params)
    respond_with(@revisiondipute)
  end

  def destroy
    @revisiondipute.destroy
    respond_with(@revisiondipute)
  end

  private
    def set_revisiondipute
      @revisiondipute = Revisiondipute.find(params[:id])
    end

    def revisiondipute_params
      params.require(:revisiondipute).permit(:comment, :revisionreview_id)
    end
end
