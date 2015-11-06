require 'rails_helper'

feature 'User insert a new recipe' do
  scenario 'successfully' do
    create(:kitchen)
    create(:type_of_food)
    create(:preference)
    visit new_recipe_path

    fill_in 'Receita:', with: 'Pudim de Leite'
    select('Portuguesa', from: 'Cozinha:')
    select('Sobremesa', from: 'Tipo de Comida:')
    select('Sem gluten', from: 'Preferência de Comida:')
    fill_in 'Serve:', with: '5'
    select('Médio', from: 'Dificuldade:')
    fill_in 'Tempo de Preparo:', with: '45'
    fill_in 'Ingredientes:', with: '1 Leite Condensado, 1 lata de Leite Longa
                                   Vida, 4 gemas'
    fill_in 'Passo a Passo:', with: 'Bata todos os ingredientes no
                                     liquidificador, após coloque o creme em
                                     uma forma untada com melado (açúcar
                                     derretido com água) e leve ao banho-maria
                                     por 40 minutos. Sirva frio.'
    attach_file('Selecione uma foto:', 'spec/fotos/Pudim.JPG')
    click_on 'Cadastrar Receita'

    expect(page).to have_content 'Pudim de Leite'
    expect(page).to have_content 'Portuguesa'
    expect(page).to have_content 'Sobremesa'
    expect(page).to have_content 'Sem gluten'
    expect(page).to have_content '5 pessoas'
    expect(page).to have_content '45 minutos'
    expect(page).to have_content 'Médio'
    expect(page).to have_content '1 Leite Condensado, 1 lata de Leite Longa
                                  Vida, 4 gemas'
    expect(page).to have_content 'Bata todos os ingredientes no
                                  liquidificador, após coloque o creme em
                                  uma forma untada com melado (açúcar
                                  derretido com água) e leve ao banho-maria
                                  por 40 minutos. Sirva frio.'
    expect(page).to have_xpath("//img[contains(@src, 'Pudim.JPG')]")
  end

  scenario 'unsuccessfully' do
    visit new_recipe_path

    click_on 'Cadastrar Receita'

    expect(page).to have_content 'Por favor, verifique os dados obrigatórios'
  end
end
