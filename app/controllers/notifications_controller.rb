class NotificationsController < ApplicationController
  def destroy
    @note = Notification.find(params[:id])
    @note.destroy
    redirect_to :back
  end
end
