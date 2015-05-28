class RatingsController < ApplicationController
  respond_to :html
  def new
    @rating = Rating.new
    respond_with(@rating)
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.save
    redirect_to trail_url(@rating.trail_id)
  end

  def destroy
    @rating = Rating.find(param[:id])
    @rating.destroy
    respond_with(@rating)
  end

  private
    def rating_params
      params.require(:rating).permit(:difficulty,:durationinsec,:favourite,:user_id,:trail_id)
end
