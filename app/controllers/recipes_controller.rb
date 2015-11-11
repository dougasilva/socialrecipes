class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      flash.now[:error] = 'Por favor, verifique os dados obrigatórios'
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.order('created_at DESC').limit(20)
    @kitchens = Kitchen.all
    @typeoffoods = TypeOfFood.all
    @preferences = Preference.all
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :kitchen_id, :type_of_food_id, :foto,
                                   :preference_id, :amount, :time_preparation,
                                   :difficulty, :ingredients, :preparation)
  end
end
