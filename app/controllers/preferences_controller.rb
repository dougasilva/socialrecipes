class PreferencesController < ApplicationController
  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new(preference_params)
    if @preference.save
      redirect_to @preference
    else
      flash.now[:error] = 'Por favor, verifique os dados obrigatórios'
      render 'new'
    end
  end

  def show
    @preference = Preference.find(params[:id])
  end

  def index
    @preferences = Preference.all
  end

  private

  def preference_params
    params.require(:preference).permit(:name)
  end
end
