class TypeOfFoodsController < ApplicationController
  def new
    @typeoffood = TypeOfFood.new
  end

  def create
    @typeoffood = TypeOfFood.create(typeoffood_params)
    if @typeoffood.save
      redirect_to @typeoffood
    else
      flash.now[:error] = 'Por favor, verifique os dados obrigatórios'
      render 'new'
    end
  end

  def show
    @typeoffood = TypeOfFood.find(params[:id])
  end

  def index
    @typeoffoods = TypeOfFood.all
  end

  private

  def typeoffood_params
    params.require(:type_of_food).permit(:name)
  end
end
