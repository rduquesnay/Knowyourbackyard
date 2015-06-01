class ActionsController < ApplicationController
  before_action :ensure_admin!, only: :promote_to_admin
  before_action :ensure_owner!, only: :demote_from_admin
  before_action :set_user
  
  respond_to :html
  def promote_to_trailblazer
    if @user.points >=1400 || current_user.admin?
      @user.update_attribute(:trailblazer, true)
    end
    redirect_to :root
  end

  def promote_to_admin
    @user.update_attribute(:admin, true)
    redirect_to :users_path
  end

  def demote_from_admin
    @user.update_attribute(:admin, false)
    redirect_to :users_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
