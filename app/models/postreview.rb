
class Postreview
  def initialize(params)
    @review = params[:review]
    @trail=params[:trail]
    @reviewuser = params[:reviewuser]
    @trailuser = User.find(@trail.user_id)
    @success=nil
    @check = params[:check]
  end

  def post
    ActiveRecord::Base.transaction do
      if @check
        @success = @trail.update_attribute(:status, "Under review")
        unless @success
          raise ActiveRecord::Rollback
        end
        @succus = @review.save
        unless @success
          raise ActiveRecord::Rollback
        end
        @notice = Notice.new({type: "Trail Reviewed Needs Changes", link_id: @review.id, to_user: @trail.user_id, trail_id: @trail.id, trail_name: @trail.name})
      else
        @success = @trail.update_attribute(:status, "Accepted")
        unless @success
          raise ActiveRecord::Rollback
        end
        @success = @trailuser.update_attribute(:points, @trailuser.points+200)
        unless @success
          raise ActiveRecord::Rollback
        end
        @notice = Notice.new({type: "Trail Reviewed Accepted", link_id: @trail.id, to_user: @trail.user_id, trail_id: @trail.id, trail_name: @trail.name})
      end
      @success = @reviewuser.update_attribute(:points, @reviewuser.points+150)
      unless @success
        raise ActiveRecord::Rollback
      end
      @success = @notice.send
      unless @success
        raise ActiveRecord::Rollback
      end
    end
    return @success
  end
end
