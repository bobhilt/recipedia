class ReviewsController < ApplicationController
  
  before_action :require_user, except: [:index, :show]

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
#    @reviews = @recipe.Review.paginate(page: params[:page], per_page: 2)
#    @reviews = Review.paginate(page: params[:page], per_page: 1)
    
  end
  
  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:success] = "Review successfully updated."
      redirect_to recipe_path(@review.recipe_id)
    else
      render :edit
    end
  end

  def destroy
    review = Review.find(params[:id])
    recipe = Recipe.find(review.recipe_id)
    review.destroy
    flash[:success] = "Review Deleted"
    redirect_to recipe_path(recipe)
  end

  private
    def review_params
      params.require(:review).permit(:summary, :description)
    end
end