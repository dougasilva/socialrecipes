require 'rails_helper'
feature 'Admin create new type of food' do
  scenario 'Succesffuly' do
    visit new_type_of_food_path
    fill_in 'Nome:', with: 'Sobremesa'

    click_on 'Cadastrar Tipo'

    expect(page).to have_content 'Sobremesa'
  end

  scenario 'unsuccessfully' do
    visit new_type_of_food_path

    click_on 'Cadastrar Tipo'

    expect(page).to have_content 'Por favor, verifique os dados obrigatórios'
  end
end
