class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many :likes, dependent: :destroy
  
  has_many :recipe_styles, dependent: :destroy
  has_many :styles, through: :recipe_styles
  
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients

  has_many :reviews, dependent: :destroy
  
  validates :chef_id, presence: true
  validates :name, presence: true, length: {minimum: 5, maximum: 100}
  validates :summary, presence: true, length: {minimum: 5, maximum: 100}
  validates :description, presence: true, length: { maximum: 3000 }
  mount_uploader :picture, PictureUploader
  validate :picture_size
  default_scope -> { order(updated_at: :desc)}
  
  def thumbs_up_total
    self.likes.where(like: true).size
  end
  
  def thumbs_down_total
    self.likes.where(like: false).size
  end

  def reviews_by_chef(chef_id)
    reviews.where(chef_id: chef_id)
  end
  
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "maximum size 5mb")
      end
    end
end