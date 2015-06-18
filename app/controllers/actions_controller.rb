class ActionsController < ApplicationController
  before_action :ensure_admin!, only: [:promote_to_admin, :demote_from_trailblazer]
  before_action :ensure_owner!, only: :demote_from_admin
  before_action :authenticate_user!, only: :promote_to_trailblazer
  before_action :set_user, only: [:promote_to_admin, :promote_to_trailblazer, :demote_from_trailblazer, :demote_from_admin]
  
  respond_to :html
  def promote_to_trailblazer
    if @user.points >=1400 || current_user.admin?
      if current_user.admin?
        @user.update_attribute(:trailblazer, true)
        @user.update_attribute(:demoted, false)
      elsif !@user.demoted
        @user.update_attribute(:trailblazer, true)
      end
    end
    if current_user.admin?
      redirect_to users_path
    else
      redirect_to root_path
    end
  end

  def demote_from_trailblazer
    @user.update_attribute(:trailblazer, false)
    @user.update_attribute(:demoted, true)
    redirect_to users_path
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
    self.class.transaction do
      trail.update({name: revision.name, location: revision.location, length: revision.length, season: revision.season, trailtype: revision.trailtype, latitude: revision.latitude, longitude: revision.longitude, traildirections: revision.traildirections, user_id: trail.user_id, status: "Accepted"})
      revisionuser.update_attribute(:points, revisionuser.points+150)
      user.update_attribute(:points, user.points+150)
      revision.destroy
    end
    redirect_to trailreviewindex_path 
  end

  def toggle_trail_viewablebyguest
    trail = Trail.find(params[:trail_id])
    if trail.viewbyguest?
      trail.update_attribute(:viewbyguest, false)
    else
      trail.update_attribute(:viewbyguest, true)
    end
    if params[:path]=="trailindex"
      redirect_to trails_path
    else
      redirect_to root_path
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
