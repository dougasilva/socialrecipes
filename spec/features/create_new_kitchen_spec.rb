require 'rails_helper'
feature 'Admin create a new kitchen' do
  scenario 'Successffuly' do
    visit new_kitchen_path

    fill_in 'Nome:', with: 'Brasileira'

    click_on 'Cadastrar Cozinha'

    expect(page).to have_content 'Brasileira'
  end

  scenario 'unsuccessfully' do
    visit new_kitchen_path

    click_on 'Cadastrar Cozinha'

    expect(page).to have_content 'Por favor, verifique os dados obrigatórios'
  end
end
