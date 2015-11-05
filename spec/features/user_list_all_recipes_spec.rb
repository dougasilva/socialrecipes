require 'rails_helper'
feature 'User list all recipes' do
  scenario 'Successffuly' do
    recipe = create(:recipe)
    recipe2 = create(:recipe, name: 'Picadinho de Carne', kitchen: 'Brasileira',
                              type_of_food: 'Carnes', preference: 'Bovino',
                              amount: 5, time_preparation: 75,
                              difficulty: 'Médio', ingredients: '200 g de carne
                              (patinho, alcatra) em tirinhas, 2 linguiças de
                              churrasco em pedaços, 1 gomo de calabresa em
                              pedaços, 200 g de bacon em pedaços, 2 pimentões
                              em tirinhas, azeitona sem caroço, molho de tomate,
                              milho verde, óleo', preparation: 'Frite a carne,
                              a linguiça, a calabresa e o bacon separados;
                              Doure os pimentões com óleo (ou da forma que
                              preferir); Acrescente o bacon, mexendo por mais
                              uns 3 minutos; Junte a carne, a linguiça e a
                              calabresa mexendo por 1 minuto; Acrescente o molho
                              de tomate, azeitona e milho verde mexendo
                              por 2 minutos',
                              foto_file_name: 'picadinho_de_carnes.jpg')
    visit recipes_path
    expect(page).to have_content recipe.name
    expect(page).to have_content recipe2.name
  end

  scenario 'Visit recipes info and go back to list' do
    recipe = create(:recipe)
    visit recipes_path
    click_on recipe.name

    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.kitchen
    expect(page).to have_content recipe.type_of_food
    expect(page).to have_content recipe.preference
    expect(page).to have_content recipe.amount
    expect(page).to have_content recipe.time_preparation
    expect(page).to have_content recipe.difficulty
    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.preparation

    click_on 'Voltar'
    expect(page).to have_content recipe.name
  end
end
