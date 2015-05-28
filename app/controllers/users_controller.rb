class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit,:update]
  respond_to :html
  def index
    @trekker = User.trekker
    @trailblazer = User.trailblazer
    @top = User.trailblazer.topusers
  end

  def show
    @trails = Trail.where(user_id: @user.id).accepted
    respond_with(@user)
  end
  def edit
  end

  def update
    @user.update(user_params)
    respond_with(@user)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:firstname,:lastname,:country,:city,:provice,:about)
    end
end
