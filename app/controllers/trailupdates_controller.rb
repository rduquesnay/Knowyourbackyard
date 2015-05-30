class TrailupdatesController < ApplicationController
  respond_to :html
  def new
    @update = Trailupdate.new
    respond_with(@update)
  end

  def create
    @update = Trailupdate.new(trailupdate_params)
    @user = User.find(current_user.id)
    @update.save
    @reward = Reward.new(points: 25,update_id: @update.id,user_id: @user.id)
    @user.update_attribute(:points, @reward.points)
    @reward.save
    redirect_to trail_url(@update.trail_id)
  end

  def destroy
    @update = Trailupdate.find(params[:id])
    @reward = Reward.where(update_id: @update.id)
    @user = User.find(@reward.user_id)
    @user.update_attribute(:points,@user.points-@reward.points)
    @update.destroy
    @reward.destroy 
    respond_with(@update)
  end

  private
    def trailupdate_params
      params.require(:trailupdate).permit(:message,:trail_id,:user_id)
    end
end
