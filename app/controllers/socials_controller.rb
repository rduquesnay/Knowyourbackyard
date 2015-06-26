class SocialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_social, only: [:edit, :update, :destroy]

  respond_to :html

  def new
    @social = Social.new
    @id=params[:id]
    respond_with(@social)
  end

  def edit
    @id=@social.user_id
  end

  def create
    @social = Social.new(social_params)
    if @social.save
      redirect_to user_path(@social.user.id)
    else
      render 'new'
    end
  end

  def update
    @social.update(social_params)
    redirect_to user_path(@social.user.id)
  end

  def destroy
    @social.destroy
    redirect_to user_path(@social.user.id)
  end

  private
    def set_social
      @social = Social.find(params[:id])
    end

    def social_params
      params.require(:social).permit(:facebook_link, :linkedin_link, :youtube_link, :instagram_link, :user_id)
    end
end
