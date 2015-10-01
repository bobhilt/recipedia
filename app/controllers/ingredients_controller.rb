class IngredientsController < ApplicationController
  before_action :require_user, except: [:show]
  
  def show
    @ingredient = Ingredient.find(params[:id])
    @title = "Recipes using: " + @ingredient.name
    @pagination = @ingredient.recipes.paginate(page: params[:page], per_page: 3)
    @recipes = @ingredient.recipes
  end
  
  def new
    @ingredient = Ingredient.new
  end
  
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:success] = "Ingredient saved."
      redirect_to recipes_path
    else
      render 'new'
    end
  end
  
  private
    def ingredient_params
      params.require(:ingredient).permit(:name)
    end
end