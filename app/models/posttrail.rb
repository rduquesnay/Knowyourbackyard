class Posttrail
  def initialize(params)
    @trail=params[:trail]
    @rating=params[:rating]
    @user=User.find(@trail.user_id)
    @success=nil
  end

  def post
    ActiveRecord::Base.transaction do
      @trail.avgdifficulty=@rating.difficulty
      @trail.avgduration=@rating.durationinsec
      if @user.trailblazer?
        @trail.status="Accepted"
        @user.update_attribute(:points, @user.points+200)
      end
      @success = @trail.save
      unless @success
        raise ActiveRecord::Rollback
      end
      @rating.user_id=@trail.user_id 
      @rating.trail_id= @trail.id
      @success =  @rating.save
      unless @success
        raise ActiveRecord::Rollback
      end
    end
    return @success
  end
end
