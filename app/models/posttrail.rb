class Posttrail
  def initialize(params)
    @trail=params[:trail]
    @rating=params[:rating]
    @user=User.find(@trail.user_id)
  end

  def post
    ActiveRecord::Base.transaction do
      @trail.avgdifficulty=@rating.difficulty
      @trail.avgduration=@rating.durationinsec
      if @user.trailblazer?
        @trail.status="Accepted"
        @user.update_attribute(:points, @user.points+200)
      end
      @trail.save
      @trail.images.store unless @trail.images.nil?
      @rating.user_id=@trail.user_id 
      @rating.trail_id= @trail.id
      @rating.save
    end
  end
end
