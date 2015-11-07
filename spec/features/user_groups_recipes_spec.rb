require 'rails_helper'
feature 'User group recipes' do
  scenario 'Kitchen' do
    brasileira = create(:kitchen, name: 'Brasileira')

    receita1 = create(:recipe)
    receita2 = create(:recipe, kitchen: brasileira)
    receita3 = create(:recipe, name: 'Feijoada', kitchen: brasileira)

    visit recipes_path
    click_on receita2.kitchen.name

    expect(page).to have_content receita2.name
    expect(page).to have_content receita2.preference.name
    expect(page).to have_content receita2.kitchen.name
    expect(page).to have_content receita2.difficulty
    expect(page).to have_content receita3.name
    expect(page).to have_content receita3.preference.name
    expect(page).to have_content receita3.kitchen.name
    expect(page).to have_content receita3.difficulty
  end

  scenario 'Type of food' do
    salada = create(:type_of_food, name: 'Salada')

    receita1 = create(:recipe)
    receita2 = create(:recipe, type_of_food: salada)
    receita3 = create(:recipe, name: 'Couve Flor', type_of_food: salada)

    visit recipes_path
    click_on receita2.type_of_food.name

    expect(page).to have_content receita2.name
    expect(page).to have_content receita2.preference.name
    expect(page).to have_content receita2.kitchen.name
    expect(page).to have_content receita2.difficulty
    expect(page).to have_content receita3.name
    expect(page).to have_content receita3.preference.name
    expect(page).to have_content receita3.kitchen.name
    expect(page).to have_content receita3.difficulty
  end

  scenario 'Preference' do
    vegetariana = create(:preference, name: 'Vegetariana')

    receita1 = create(:recipe)
    receita2 = create(:recipe, preference: vegetariana)
    receita3 = create(:recipe, name: 'Couve Flor', preference: vegetariana)

    visit recipes_path
    click_on receita2.preference.name

    expect(page).to have_content receita2.name
    expect(page).to have_content receita2.preference.name
    expect(page).to have_content receita2.kitchen.name
    expect(page).to have_content receita2.difficulty
    expect(page).to have_content receita3.name
    expect(page).to have_content receita3.preference.name
    expect(page).to have_content receita3.kitchen.name
    expect(page).to have_content receita3.difficulty
  end
end
