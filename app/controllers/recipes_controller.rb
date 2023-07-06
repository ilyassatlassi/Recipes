class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show public]

  def index
    @recipes = current_user.recipes.includes(:user)
  end

  def public
    @recipes = Recipe.includes(:user, :recipe_foods).where(public: true).order(created_at: :desc)
  end


  def show
    @recipe = Recipe.where(id: params[:id]).first
  end
  
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe was successfully created'
    else
      render new, status: :unprocessable_entity
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      msg = 'Recipe is Private'
      msg = 'Recipe is Public' if @recipe.public
      redirect_to recipe_path(@recipe), notice: msg
    else
      redirect_to recipe_path(@recipe), alert: 'Someting is wrong'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_path, notice: 'Recipe was deleted successfully'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
