class PagesController < ApplicationController

  respond_to :html
  def home
    render layout: "home"
  end

  def about
    render layout: "home"
  end

  def guestviewtrail

  end
  def howtosponsor
  
  end

end

