class Review < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :chef

  validates_uniqueness_of :chef, scope: :recipe
  validates :summary, presence: true
  validates :description, presence: true
end
