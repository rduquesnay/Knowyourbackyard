class ActionsController < ApplicationController
  before_action :ensure_admin!, only: :promote_to_admin
  before_action :ensure_owner!, only: :demote_from_admin
  before_action :set_user, only: [:promote_to_admin, :promote_to_trailblazer, :demote_from_admin]
  
  respond_to :html
  def promote_to_trailblazer
    if @user.points >=1400 || current_user.admin?
      @user.update_attribute(:trailblazer, true)
    end
  end

  def promote_to_admin
    @user.update_attribute(:admin, true)
    @user.update_attribute(:trailblazer, true)
    redirect_to users_path
  end

  def demote_from_admin
    @user.update_attribute(:admin, false)
    redirect_to users_path
  end
  def set_trail_to_revision
    revision = Revision.find(params[:revision_id])
    trail = Trail.find(revision.trail_id)
    revisionuser = User.find(revision.user_id)
    user = User.find(current_user.id)
    trail.update({name: revision.name, location: revision.location, length: revision.length, season: revision.season, trailtype: revision.trailtype, latitude: revision.latitude, longitude: revision.longitude, traildirections: revision.traildirections, user_id: trail.user_id, status: "Accepted"})
    revisionuser.update_attribute(:points, revisionuser.points+150)
    user.update_attribute(:points, user.points+150)
    revision.destroy
    redirect_to trailreviewindex_path 
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
