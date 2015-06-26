class TrailupdatesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :ensure_admin!, only: :destroy
  respond_to :html
  def new
    @update = Trailupdate.new
    respond_with(@update)
  end

  def create
    @update = Trailupdate.new(trailupdate_params)
    @user = User.find(current_user.id)
    if @update.save
      @user.update_attribute(:points, @user.points+25)
      redirect_to trail_path(@update.trail_id)
    else
      render 'new'
    end
  end

  def destroy
    @update = Trailupdate.find(params[:id])
    @update.destroy
    redirect_to trail_url(@update.trail_id)
  end

  private
    def trailupdate_params
      params.require(:trailupdate).permit(:message,:trail_id,:user_id)
    end
end
