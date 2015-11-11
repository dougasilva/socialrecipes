class TypeOfFoodsController < ApplicationController
  def new
    @type_of_food = TypeOfFood.new
  end

  def create
    @type_of_food = TypeOfFood.new(typeoffood_params)
    if @type_of_food.save
      redirect_to @type_of_food
    else
      flash.now[:error] = 'Por favor, verifique os dados obrigatórios'
      render 'new'
    end
  end

  def show
    @type_of_food = TypeOfFood.find(params[:id])
  end

  def index
    @type_of_foods = TypeOfFood.all
  end

  private

  def typeoffood_params
    params.require(:type_of_food).permit(:name)
  end
end
