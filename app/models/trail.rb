class Trail < ActiveRecord::Base
  belongs_to :user
  has_many :trailupdates, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :revisions, dependent: :destroy
  accepts_nested_attributes_for :ratings, allow_destroy: true


end
