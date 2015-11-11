require 'rails_helper'
feature 'User group recipes...' do
  scenario ' by Kitchen' do
    brasileira = create(:kitchen, name: 'Brasileira')

    receita1 = create(:recipe)
    receita2 = create(:recipe, name: 'Bolo de Cenoura', kitchen: brasileira)
    receita3 = create(:recipe, name: 'Feijoada', kitchen: brasileira)

    visit recipes_path
    click_on receita2.kitchen.name

    expect(page).not_to have_content receita1.name
    expect(page).not_to have_content receita1.kitchen
    expect(page).to have_content receita2.name
    expect(page).to have_content receita2.kitchen.name
    expect(page).to have_content receita3.name
    expect(page).to have_content receita3.kitchen.name
  end

  scenario ' by Type of food' do
    salada = create(:type_of_food, name: 'Salada')

    receita1 = create(:recipe)
    receita2 = create(:recipe, name: 'Couve Refogada', type_of_food: salada)
    receita3 = create(:recipe, name: 'Couve Flor', type_of_food: salada)

    visit recipes_path
    click_on receita2.type_of_food.name

    expect(page).not_to have_content receita1.name
    expect(page).not_to have_content receita1.type_of_food.name
    expect(page).to have_content receita2.name
    expect(page).to have_content receita2.type_of_food.name
    expect(page).to have_content receita3.name
    expect(page).to have_content receita3.type_of_food.name
  end

  scenario ' by Preference' do
    vegetariana = create(:preference, name: 'Vegetariana')

    receita1 = create(:recipe)
    receita2 = create(:recipe, name: 'Abobrinha', preference: vegetariana)
    receita3 = create(:recipe, name: 'Couve Flor', preference: vegetariana)

    visit recipes_path
    click_on receita2.preference.name

    expect(page).not_to have_content receita1.name
    expect(page).not_to have_content receita1.preference.name
    expect(page).to have_content receita2.name
    expect(page).to have_content receita2.preference.name
    expect(page).to have_content receita3.name
    expect(page).to have_content receita3.preference.name
  end
end
