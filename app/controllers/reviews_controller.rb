class ReviewsController < ApplicationController
  
  before_action :require_user, except: [:index, :show]
  before_action :set_current_user_reviews , only: [:edit, :update, :show, :index]

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new
  end
  
  def create
    recipe = Recipe.find(params[:recipe_id])
    @review = Review.new(review_params)
    @review.chef = current_user
    @review.recipe = recipe
    if @review.save
      flash[:success] = "Review was created successfully"
      redirect_to recipe_path(recipe)
    else
      render 'new'
    end
    
  end
  
  def index
    @title = "Reviews"
    @reviews = @recipe.reviews.paginate(page: params[:page], per_page: 1)

  end
  
  def edit
    
  end

  private
    def review_params
      params.require(:review).permit(:summary, :description)
    end
    
    def set_current_user_reviews
      if logged_in?
        @current_user_reviews = @reviews.select {|r| r.chef_id == @current_user.id}
      else
        @current_user_review = nil
      end
    end
end