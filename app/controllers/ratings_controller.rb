class RatingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :ensure_admin!, only: :destroy
  respond_to :html
  def new
    @rating = Rating.new
    respond_with(@rating)
  end

  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to trail_url(@rating.trail_id)
    else
      render 'new'
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to trail_url(@rating.trail_id)
  end

  private
    def rating_params
      params.require(:rating).permit(:difficulty,:durationinsec,:favourite,:user_id,:trail_id)
    end
end
