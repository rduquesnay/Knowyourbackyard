class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:hikingviewtrail, :aquaticviewtrail]
  respond_to :html
  def home
    render layout: "home"
  end

  def about
    render layout: "home"
  end

  def hikingguestviewtrail
    @trails = Trail.accepted.hiking.where(viewbyguest: true)
    render "trails/trailslist"
  end

  def aquaticguestviewtrail
    @trails = Trail.accepted.aquatic.where(viewbyguest: true)
    render "trails/trailslist"
  end

  def hikingviewtrail
    @trails = Trail.accepted.hiking
    render "trails/trailslist"
  end

  def aquaticviewtrail
    @trails = Trail.accepted.aquatic
    render "trails/trailslist"
  end

  def guestviewtrail
    @trails = Trail.accepted.where(viewbyguest: true)
    render "trails/trailslist"
  end

  def howtosponsor
  
  end

end

