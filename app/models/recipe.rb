class Recipe < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 5, maximum: 100}
  validates :summary, presence: true, length: {minimum: 5, maximum: 100}
  validates :description, presence: true, length: { maximum: 3000 }
end