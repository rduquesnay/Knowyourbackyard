class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:hikingviewtrail, :aquaticviewtrail]
  respond_to :html
  def home
    render layout: "home"
  end

  def about
    render layout: "home"
  end

  def faq
  end

  def emag
  end

  def guestviewtrail
    @trails = Trail.accepted.where(viewbyguest: true)
    render "trails/trailslist"
  end
  
  def howtosponsor
  
  end

  def searchtrails
    @trails = Trail.limit(6).order("RANDOM()") 
    render "searchtrails"
  end
  def searchresults
    @trails = Trail.all
    unless params[:name]==""
      @trails = @trails.searchname(params[:name])
    end
    unless params[:location]==""
      @trails = @trails.searchlocation(params[:location])
    end
    unless params[:length]==4
      case params[:length]
      when 1
        @trails = @trails.where("length <= 10")
      when 2
        @trails = @trails.where("length > 10 and length <= 20")
      when 3
        @trails = @trails.where("length > 20")
      end
    end
    unless params[:season].count==4 || params[:season].count==0
      @trails = @trails.where(season: params[:season])
    end
    unless params[:season].count==3 || params[:season].count==0
      @trails = @trails.where(trailtype: params[:trailtype])
    end
    
    render "searchtrails"
  end
end

