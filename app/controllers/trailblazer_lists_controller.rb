class TrailblazerListsController < ApplicationController
  before_action :ensure_trailblazer!, only: :trailsreview
  respond_to :html

  def trailsreview
    @review = Trail.unreviewed
    @revision = Revision.all
    #@disputed = Dispute.all
  end
end
