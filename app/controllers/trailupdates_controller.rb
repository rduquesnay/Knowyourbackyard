class TrailupdatesController < ApplicationController
  respond_to :html
  def new
    @update = Trailupdate.new
    respond_with(@update)
  end

  def create
    @update = Trailupdate.new(trailupdate_params)
    @update.save
    redirect_to trail_url(@update.trail_id)
  end
  def destroy
    @update = Trailupdate.find(params[:id])
    @update.destroy
    respond_with(@update)
  end

  private
    def trailupdate_params
      params.require(:trailupdate).permit(:message,:trail_id,:user_id)
    end
end
